import os
import json
import shutil
from enum import StrEnum
from typing import Any
from .constants import CONFIG_DIR

class Configuration(StrEnum):
    INITIALIZED = "initialized"

class SimboConfig:
    """
    Configuration manager for the simbo CLI tool implemented as a singleton.
    Handles reading, writing, and updating configuration from a .simbo file.
    """
    # Class variable to hold the singleton instance
    _instance = None
    
    def __new__(cls):
        """Ensure only one instance of SimboConfig exists."""
        if cls._instance is None:
            cls._instance = super(SimboConfig, cls).__new__(cls)
            cls._instance._initialized = False
        return cls._instance
    
    def __init__(self):
        """
        Initialize the configuration manager (only runs once).
        """
        # Skip initialization if already done
        if self._initialized:
            return
        self.config_dir = CONFIG_DIR
            
        # Ensure the config directory exists
        os.makedirs(self.config_dir, exist_ok=True)
        
        self.config_file = os.path.join(self.config_dir, 'config')
        self._config = self._load_config()
        self._initialized = True
    
    @classmethod
    def get_instance(cls):
        """Get or create the singleton instance."""
        if cls._instance is None:
            return cls()
        return cls._instance
    
    def _load_config(self) -> dict[str, Any]:
        """Load configuration from file or create a new one if it doesn't exist."""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    # Read each line as a key=value pair
                    config = {}
                    for line in f:
                        line = line.strip()
                        if not line or line.startswith('#'):
                            continue
                        if '=' in line:
                            key, value = line.split('=', 1)
                            config[key.strip()] = self._parse_value(value.strip())
                    return config
            except Exception as e:
                print(f"Error loading config: {e}")
                return {}
        return {}
    
    def _parse_value(self, value: str) -> Any:
        """Parse string values into appropriate Python types."""
        # Try to parse as JSON first (handles booleans, null, numbers)
        try:
            return json.loads(value)
        except json.JSONDecodeError:
            # If that fails, just return the string value
            return value
    
    def _format_value(self, value: Any) -> str:
        """Format Python value for storage in config file."""
        if isinstance(value, (str, int, float, bool)) or value is None:
            return json.dumps(value)
        # For complex types like lists/dicts, serialize to JSON
        return json.dumps(value)
    
    def get(self, key: str, default: Any = None) -> Any:
        """Get a configuration value by key."""
        return self._config.get(key, default)
    
    def set(self, key: str, value: Any) -> None:
        """Set a configuration value by key."""
        self._config[key] = value
        self._save_config()
    
    def delete(self, key: str) -> bool:
        """Delete a configuration key. Returns True if key existed."""
        if key in self._config:
            del self._config[key]
            self._save_config()
            return True
        return False
    
    def list(self) -> dict[str, Any]:
        """Return all configuration as a dictionary."""
        return dict(self._config)
    
    def _save_config(self) -> None:
        """Save configuration to file."""
        # Create a backup of the existing config first
        if os.path.exists(self.config_file):
            backup_file = f"{self.config_file}.bak"
            shutil.copy2(self.config_file, backup_file)
            
        try:
            with open(self.config_file, 'w') as f:
                f.write("# Simbo CLI Configuration\n")
                for key, value in self._config.items():
                    f.write(f"{key}={self._format_value(value)}\n")
        except Exception as e:
            print(f"Error saving config: {e}")
            # Restore from backup if available
            if os.path.exists(f"{self.config_file}.bak"):
                shutil.copy2(f"{self.config_file}.bak", self.config_file)
    
    def reset(self) -> None:
        """Reset configuration to empty state."""
        self._config = {}
        self._save_config()
    
    def import_dict(self, config_dict: dict[str, Any]) -> None:
        """Import configuration from a dictionary."""
        self._config.update(config_dict)
        self._save_config()
    
    def import_file(self, file_path: str) -> bool:
        """Import configuration from another file."""
        try:
            with open(file_path, 'r') as f:
                config = {}
                for line in f:
                    line = line.strip()
                    if not line or line.startswith('#'):
                        continue
                    if '=' in line:
                        key, value = line.split('=', 1)
                        config[key.strip()] = self._parse_value(value.strip())
                
                self._config.update(config)
                self._save_config()
                return True
        except Exception as e:
            print(f"Error importing config: {e}")
            return False
    
    # Static methods to provide direct access to config operations without managing instances
    @staticmethod
    def get_value(key: str, default: Any = None) -> Any:
        """Static method to get a configuration value."""
        return SimboConfig.get_instance().get(key, default)
    
    @staticmethod
    def set_value(key: str, value: Any) -> None:
        """Static method to set a configuration value."""
        SimboConfig.get_instance().set(key, value)
    
    @staticmethod
    def delete_value(key: str) -> bool:
        """Static method to delete a configuration value."""
        return SimboConfig.get_instance().delete(key)
    
    @staticmethod
    def list_values() -> dict[str, Any]:
        """Static method to list all configuration values."""
        return SimboConfig.get_instance().list()
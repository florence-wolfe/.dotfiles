from setuptools import setup, find_packages

setup(
    name="simbo",
    version="0.0.1",
    packages=find_packages(),
    include_package_data=True,
    install_requires=["rich_click", "halo"],
    entry_points="""
        [console_scripts]
        simbo=simbo.cli:cli
    """,
)

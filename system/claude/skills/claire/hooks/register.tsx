import type { Register } from 'claude-code'

const BACKGROUND = '#164A7A'
const TEXT = '#FFE45C'
const MARKER = '#F5A9B8'

export const register: Register = on => {
  // Only rows you typed: notifications and peer messages keep the engine's drawing.
  on('ui.render', { component: 'UserMessage' }, ($, e, next) => {
    const kind = e.props.origin.kind
    if (kind !== 'composer' && kind !== 'bridge') {
      return next(e)
    }

    const { Box, Text } = $.ui.resolve(e)

    return (
      <Box flexDirection="row" width="100%" backgroundColor={BACKGROUND}>
        <Text color={MARKER} backgroundColor={BACKGROUND} bold>
          {'❯ '}
        </Text>
        <Box flexGrow={1}>
          <Text color={TEXT} backgroundColor={BACKGROUND} bold>
            {e.props.text}
          </Text>
        </Box>
      </Box>
    )
  })
}

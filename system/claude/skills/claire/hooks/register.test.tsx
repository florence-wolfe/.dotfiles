import { expect, test } from 'claude-code/testing'

const SURFACES = ['terminal', 'desktop', 'vscode', 'mobile'] as const

test('your prompts draw yellow on blue', async $ => {
  for (const surface of SURFACES) {
    const ui = await $.ui.mount({
      plugin: 'claire',
      surface,
      component: 'UserMessage',
      props: { text: 'ship it', origin: { kind: 'composer' }, isExpanded: true },
    })
    const body = await ui.find({ type: 'Text', text: 'ship it' })
    expect(body?.props.color).toBe('#FFE45C')
    expect(body?.props.backgroundColor).toBe('#164A7A')
    await ui.unmount()
  }
})

test('rows you did not type keep the engine drawing', async ($, on) => {
  on('ui.render', (hook$, e) => {
    const { Text } = hook$.ui.resolve(e)
    return <Text>engine row</Text>
  })

  const ui = await $.ui.mount({
    plugin: 'claire',
    surface: 'terminal',
    component: 'UserMessage',
    props: { text: 'from the sdk', origin: { kind: 'sdk' }, isExpanded: true },
  })
  expect(await ui.find({ type: 'Text', text: 'engine row' })).toBeDefined()
  expect(await ui.find({ type: 'Text', text: 'from the sdk' })).toBeUndefined()
  await ui.unmount()
})

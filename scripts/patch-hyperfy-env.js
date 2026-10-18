import { readFileSync, writeFileSync } from 'node:fs'

const file = '/app/build/index.js'
const needle = 'globalThis.env = ${JSON.stringify(publicEnvs)}'
const replacement = `${needle}\n  globalThis.env.PUBLIC_WS_URL = (location.protocol === 'https:' ? 'wss:' : 'ws:') + '//' + location.host + '/ws'`

const source = readFileSync(file, 'utf8')
const matches = source.split(needle).length - 1
if (matches !== 1) {
  throw new Error(`Expected one Hyperfy env.js template in ${file}, found ${matches}`)
}

writeFileSync(file, source.replace(needle, replacement))

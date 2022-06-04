import { readJSON, writeJSON, removeFile } from 'https://deno.land/x/flat@0.0.14/mod.ts'

const filename = Deno.args[0]
const json = await readJSON(filename)
const slugify = (str) => str.toLowerCase().replace(/\s\-\s/, ' ').split(' ').join('-')

for (const episode in json) {
  const episodeData = json[episode]
  const episodeFile = `${slugify(episodeData.title)}.json`
  await writeJSON(episodeFile, episodeData)
}


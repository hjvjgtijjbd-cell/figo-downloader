const { Telegraf } = require('telegraf');
const bot = new Telegraf(process.env.BOT_TOKEN);

bot.start((ctx) => ctx.reply('✅ FIGO BOT خدام! مرحبا بيك'));

bot.on('text', (ctx) => {
  ctx.reply('وصلك: ' + ctx.message.text);
});

bot.launch().then(()=>console.log('Bot online')).catch(e=>console.error(e));

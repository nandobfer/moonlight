local spellbook = Action()

function spellbook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local text = ""
	local tlvl = {}
	local tml = {}
	local descriptions = {
		-- Necromancer --
	["Heal Summons"] = "'Sifona parte de sua propria vida para seus lacaios'" ,
	["Death Strike"] = "'Consome um pouco da propria essencia pra causar um dano moderado de morte'" ,
	["Drain Summons"] = "'Drena metade da vida de seus lacaios para se curar'" ,
	["Strong Death Strike"] = "'Consome um pedaco da propria essencia pra causar um dano alto de morte'" ,
	["Summon Skeletons"] = "'Sumona guerreiros esqueletos'" ,
	["Summon Ghoul"] = "'Sumona um cadaver putrefato'" ,
	["Summon Zombie"] = "'Sumona um zumbi feroz'" ,
	["Summon Demon Skeleton"] = "'Sumona um poderoso esqueleto demoniaco'" ,
	["Summon Gladiator Skeleton"] = "'Sumona um esqueleto gladiador'" ,
	["Summon Spectre"] = "'Sumona um espectro maligno que so pode ser destruido por dano magico'" ,
	["Summon Grim Reaper"] = "'Sumona um esqueleto a servico da propria morte'" ,
	["Summon Undead Dragon"] = "'Sumona um poderoso dragao esqueleto. Esse dragao nao pode ser sumonado caso possua outros lacaios'" ,
	["Ultimate Death Strike"] = "'Consome metade da propria essencia pra causar um dano altissimo de morte'" ,
	["Drain Life"] = "'Drena vida dos inimigos, se curando de acordo com a quantidade de inimigos atingidos'" ,
	["Curse"] = "'Amaldicoa o alvo, fazendo com que ele receba dano de morte ao longo do tempo'" ,
	["Conversao de Vida"] = "'Manipula a propria essencia vital, convertendo vida em mana'" ,
	["Conjure Wand of Darkness"] = "'Transforma temporariamente parte da sua vida em energia das trevas, produzindo uma arma magica capaz de causar muito dano de morte, porem dura apenas 15 minutos'" ,

		-- Assassin --
	["Eviscerate"] = "'Consome pontos de combo pra causar alto dano fisico baseado na quantidade de pontos consumidos, alem de envenenar o alvo'" ,
	["Stealth"] = "'Modo furtivo'" ,
	["Poison Bomb"] = "'Consome pontos de combo pra causar dano de veneno em area baseado na quantidade de pontos consumidos'" ,
	["Throw Knife"] = "'Arremessa uma faca envenenada no alvo, gerando um ponto de combo'" ,
	["Combo Points"] = "'Diz quantos pontos de combo voce possui'" ,
	["Ambush"] = "'Embosca o alvo causando dano altissimo e gera 2 pontos de combo. So pode ser usado invisivel'" ,
	["Parkour"] = "'Requer parametro 'up' ou 'down'. Permite o assassino pular para uma posicao acima ou abaixo a sua frente'" ,
	["Fan of Knives"] = "'Arremessa facas envenenadas em todos inimigos proximos. Cada inimigo atingido tem chance de gerar um ponto de combo'" ,
	["Killing Spree"] = "'Se teleporta em volta do alvo e realiza uma serie de ataques muito rapidos antes de retornar para a posicao inicial'" ,

		-- Druid --
	["Bear Form"] = "'Se transforma em Urso, aumentando consideravelmente sua vitalidade, seu dano desarmado (porque urso tem garra) e regenera vida'" ,
	["Feral Form"] = "'Se transforma em uma fera, aumentando consideravelmente sua velocidade e seu dano desarmado'" ,
	["Plant Beast Form"] = "'Mistura seu poder de transformacao com a manipulacao de planta, se transformando em uma poderosa besta de madeira e folhas, recebendo um aumento consideravel na vida, na regeneracao de vida, alem de um aumento altissimo no dano desarmado. Porem essa magia ainda nao esta dominada e a transformacao dura poucos segundos'" ,
	["Food"] = "'Conjura comida'" ,
	["Rip"] = "'*Requer metamorfose* Rasga os inimigos a sua frente, aplicando sangramento'" ,
	["Growl"] = "'*Requer metamorfose* Rosna pro inimigo de forma ameacadora'" ,
	["Light Healing"] = "'Bebe uma infusao de ervas, concedendo uma cura leve'" ,
	["Intense Healing"] = "'Bebe uma infusao bem concentrada de ervas, concedendo uma cura forte'" ,
	["Heal Friend"] = "'Cura um alvo aliado com ervas medicinais'" ,
	["Mass Healing"] = "'O poder da natureza cura todos os aliados proximos'" ,
	["Nature's Embrace"] = "'Cura um aliado com uma medicina natural poderosissima'" ,
	["Bite"] = "'*Requer metamorfose* Morde o alvo, causando sangramento'" ,
	["Strong Terra Strike"] = "'Brota uma planta poderosa embaixo do alvo, causando dano moderado de terra'" ,
	["Terra Strike"] = "'Brota uma plantinha embaixo do alvo, causando dano de terra'" ,
	["Terra Wave"] = "'Faz brotar um monte de cipo na sua frente, causando dano de terra aos atingidos'" ,
	["Ultimate Terra Strike"] = "'Brota uma planta gigante embaixo do alvo, causando dano altissimo de terra'" ,
	["Wrath of Nature"] = "'Faz crescer uma floresta a sua volta, causando alto dano de terra a todos atingidos'" ,
	["Focused Wrath of Nature"] = "'Canaliza toda a forca da floresta em um unico alvo, causando dano altissimo'" ,
	
		-- Paladin --
	["Divine Caldera"] = "'Conjura o poder sagrado da luz em uma grande area a sua volta, causando dano a todos que merecem e curando os aliados'" ,
	["Divine Healing"] = "'Conjura um milagre de luz para se curar e gera 1 poder sagrado'" ,
	["Judgement"] = "'Conjura o poder da luz para julgar o alvo, causando dano sagrado. Tem chance de gerar 1 poder sagrado'" ,
	["Holy Light"] = "'Conjura um milagre de luz em um aliado para o curar'" ,
	["Lay Hands"] = "'Conjura um poderoso milagre de luz em aliado para um curar'" ,
	["Prayer"] = "'Comeca a rezar, fazendo os inimigos proximos sentirem vontade de te atacar'" ,
	["Salvation"] = "'Conjura um poderoso milagre de luz para se curar'" ,
	["Great Light"] = "'Conjura uma forte luz pra iluminar a area a sua volta'" ,
	["Ultimate Light"] = "'Conjura uma luz poderosissima pra iluminar muito a area a sua volta'" ,
	["Protector"] = "'Assume uma postura defensiva, facilitando o manuseio do seu escudo e diminuindo o dano que voce causa e recebe'" ,
	["Holy Word: Glory"] = "'Consome todo poder sagrado, curando sua vida pra cada poder consumido'" ,
	["Crusader Strike"] = "'Golpeia com sua arma abencoada, causando parte do dano como sagrado. Gera 1 poder sagrado'" ,
	["Holy Word: Templar's Verdict"] = "'Consome todo poder sagrado, reluzindo sua arma e causando dano adicional pra cada poder consumido. Parte do dano causado eh sagrado'" ,

		--Sorcerer--
	["Cauterize Wounds"] = "'Calcina suas feridas, recebendo uma cura leve'" ,
	["Energy Beam"] = "'Evoca um raio que causa dano aos inimigos em uma linha reta na sua frente'" ,
	["Energy Strike"] = "'Evoca um raio que causa dano ao alvo'" ,
	["Energy Wave"] = "'Cria uma onda eletromagnetica que se move a sua frente, causando dano de raio aos atingidos'" ,
	["Eternal Winter"] = "'Congela tudo a sua volta, causando intenso dano de gelo aos atingidos'" ,
	["Fire Wave"] = "'Cria uma onda de calor que se move a sua frente, causando dano de fogo aos atingidos'" ,
	["Flame Strike"] = "'Lança uma bola de fogo que causa dano ao alvo'" ,
	["Great Energy Beam"] = "'Evoca um grande raio que causa muito dano aos inimigos em uma linha reta na sua frente'" ,
	["Great Fire Wave"] = "'Cria uma grande onda de calor que se move a sua frente, causando muito dano de fogo aos atingidos'" ,
	["Hell's Core"] = "'Explode um calor infernal gigante, causando muito dano de fogo aos inimigos atingidos'" ,
	["Ice Strike"] = "'Lanca uma estaca de gelo que causa dano ao alvo'" ,
	["Ice Wave"] = "'Cria uma onda de frio que se move a sua frente, causando dano de gelo aos atingidos'" ,
	["Lightning"] = "'Evoca um raio que causa muito dano ao alvo'" ,
	["Magic Shield"] = "'Conjura uma protecao magica que protege contra ataques, diminuindo sua mana no lugar na vida'" ,
	["Practice Fire Wave"] = "'Cria uma ondinha quentinha, causando daninho de fogo aos atingidos'" ,
	["Rage of the Skies"] = "'Provoca uma poderosa tempestade que assola todos os inimigos na area'" ,
	["Great Cauterize Wounds"] = "'Calcina suas feridas de forma eficaz, recebendo uma cura moderada'" ,
	["Strong Energy Strike"] = "'Evoca um grande raio que causa dano moderado ao alvo'" ,
	["Strong Flame Strike"] = "'Lança uma grande bola de fogo que causa dano moderado ao alvo'" ,
	["Strong Ice Strike"] = "'Lanca uma grande estaca de gelo que causa dano moderado ao alvo'" ,
	["Strong Ice Wave"] = "'Cria uma grande onda de frio que se move a sua frente, causando alto dano de gelo aos atingidos'" ,
	["Ultimate Energy Strike"] = "'Evoca um poderosissimo raio que causa muito dano ao alvo'" ,
	["Ultimate Flame Strike"] = "'Lança uma poderosissima bola de fogo que causa muito dano ao alvo'" ,
	["Ultimate Ice Strike"] = "'Lanca uma poderosissima estaca de gelo que causa muito dano ao alvo'" ,
	["Create Illusion"] = "'Se transforma em um monstro para enganar os outros'" ,
	["Levitate"] = "'Se torna leve como uma pena, permitindo flutuar pra cima ou pra baixo de lugares'" ,
	["Cancel Magic Shield"] = "'Destroi seu escudo de magia'" ,
	["Enchant Staff"] = "'Encanta um cajado, aumentando seus atributos consideravelmente'" ,
	["Enchant Spear"] = "'Encanta uma spear, aumentando muito o dano causado por ela'" ,
	["Teleport"] = "'Teleporta voce e todos a sua volta para a cidade destino. Consome toda mana que possuir'" ,

		--Warrior--
	["Annihilation"] = "'Como um tornado de aco, causa um dano altissimo a todos inimigos ao seu redor, se curando pra cada inimigo atingido'" ,
	["Berserk"] = "'Gira sua arma, causando dano a todos inimigos ao seu redor, se curando pra cada inimigo atingido'" ,
	["Blood Rage"] = "'Entra em furia, aumentando consideravelmente o dano causado mas tambem o dano recebido, e desabilita a defesa'" ,
	["Brutal Strike"] = "'Ataca o alvo com um golpe preciso, curando um pouco de sua propria vida'" ,
	["Charge"] = "'Se prepara para investir contra os inimigos, recebendo muita velocidade de momento por um curto periodo de tempo'" ,
	["Fierce Berserk"] = "'Gira sua arma como uma beyblade de aco, causando muito dano a todos inimigos ao seu redor, se curando pra cada inimigo atingido'" ,
	["Groundshaker"] = "'Golpeia o chao abaixo de voce, criando um pequeno terremoto que causa dano aos inimigos na area'" ,

		--Hunter--
	["Tiro Firme"] = "'Acerta um tiro rapido no inimigo, causando dano baixo'" ,
	["Tiro Certo"] = "'Acerta um tiro certeiro no inimigo, causando muito dano'" ,
	["Chamar Fera Espiritual"] = "'Chama Hati, um lobo espiritual, pra te acompanhar e ajudar no combate. A partir do level 40, outro lobo espiritual, Skoll, também atende o seu chamado.'" ,
	["Casco de Tartaruga"] = "'Se esconde embaixo de um casco de tartaruga, se tornando incapaz de atacar e receber dano'" ,
	["Fingir de Morto"] = "'Finge que esta morto, nao podendo se mover ou atacar e engana o inimigos'" ,
	["Picada da Serpente"] = "'Um tiro especial que usa uma flecha embebida na peconha de uma cobra, causando dano de veneno ao longo do tempo. Compartilha recarga com outros tiros especiais'" ,
	["Tiro Explosivo"] = "'Um tiro especial que usa uma flecha presa a um explosivo, causando dano de fogo em uma area pequena em volta do seu alvo. Compartilha recarga com outros tiros especiais'" ,
	["Tiro Mortal"] = "'Voce tenta eliminar o inimigo. Se o alvo estiver com pouca vida, causa o triplo do dano'" ,
	["Pet Taunt"] = "'Faz seus ajudantes rosnarem ferozmente, forcando os inimigos a os atacarem'" ,
	["Mend Pet"] = "'Remenda as feridas dos seus ajudantes, fazendo com que sejam curados'" ,
	["Comando para Matar"] = "'Ordena seu ajudante a morder o alvo, causando dano fisico e aplicando sangramento '" ,
	["Lone Wolf"] = "'Como um lobo solitario, sua habilidade com armas a distancia aumenta consideravelmente. So pode ser usado se nao possuir nenhum pet'" ,
	["Barragem"] = "'Atira numa velocidade de 10 flechas por segundo. A quantidade de tiros depende da sua habilidade de combate a distancia'" ,

		--Support--
	["Haste"] = "'Por um momento, aguca os sentidos pra ficar mais rapido'" ,
	["Light"] = "'Conjura uma pequena luz pra iluminar a area ao seu redor'" ,
	["Strong Haste"] = "'Por um breve momento, aguca muito os sentidos pra ficar muito mais rapido'" ,
	["Scarlet Vial"] = "'Fermenta 1 blueberry em um frasco vazio para criar uma pocao de vida'" ,
	["Great Scarlet Vial"] = "'Fermenta 15 blueberries em um frasco vazio para criar uma pocao de vida maior'" ,
	["Strong Scarlet Vial"] = "'Fermenta 5 blueberries em um frasco vazio para criar uma pocao de vida forte'" ,
	["Ultimate Scarlet Vial"] = "'Fermenta 25 blueberry em um frasco vazio para criar uma pocao de vida extraordinaria'" ,
	["Dismiss Pet"] = "'Dispensa seus pets'" ,
	
	}

	for _, spell in ipairs(player:getInstantSpells()) do
		if spell.level ~= 0 or spell.mlevel ~= 0 then
			if spell.manapercent > 0 then
				spell.mana = spell.manapercent .. "%"
			end
			if spell.level > 0 then
				tlvl[#tlvl+1] = spell
			elseif spell.mlevel > 0 then
				tml[#tml+1] = spell
			end
		end
	end

	table.sort(tlvl, function(a, b) return a.level < b.level end)
	local prevLevel = -1
	for i, spell in ipairs(tlvl) do
		local line = ""
		if prevLevel ~= spell.level then
			if i ~= 1 then
				line = "\n"
			end
			line = line .. "Spells for Level " .. spell.level .. "\n"
			prevLevel = spell.level
		end
		text = text .. line .. "  " .. spell.name .. " - " .. spell.words .. " : " .. spell.mana .. "\n" .. (descriptions[spell.name] or "") .. "\n\n"
	end
	text = text.."\n"
	table.sort(tml, function(a, b) return a.mlevel < b.mlevel end)
	local prevmLevel = -1
	for i, spell in ipairs(tml) do
		local line = ""
		if prevLevel ~= spell.mlevel then
			if i ~= 1 then
				line = "\n"
			end
			line = line .. "Spells for Magic Level " .. spell.mlevel .. "\n"
			prevmLevel = spell.mlevel
		end
		text = text .. line .. "  " .. spell.words .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
	end


	player:showTextDialog(item:getId(), text)
	return true
end


spellbook:id(3059, 6120, 8072, 8073, 8074, 8075, 8076, 8090, 11691, 14769, 16107, 20088, 21400, 22755, 25699, 29431, 20089, 20090, 34153)
spellbook:register()

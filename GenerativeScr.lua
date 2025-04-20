local M = {}

local names = {
    "Ayesha.B", "Kiran.D", "Neha.G", "Vikram.N", "Divya.Z",
    "Ananya.R", "Ishaan.P", "Sneha.Y", "Rohit.L", "Tanvi.X",
    "Akshay.W", "Riya.E", "Harsha.Q", "Nikhil.J", "Shruti.U",
    "Kavya.I", "Manish.A", "Tanya.O", "Rahul.C", "Preeti.K",
    "Varun.B", "Simran.D", "Aditya.F", "Sakshi.G", "Rajeev.H",
    "Alok.Z", "Lavanya.M", "Deepak.N", "Ira.T", "Jay.B",
    "Sanya.V", "Sahil.K", "Amrita.X", "Aniket.Y", "Zoya.P",
    "Devika.Q", "Rakesh.J", "Chaitra.L", "Omkar.E", "Bhavana.W",
    "Rehan.S", "Pooja.F", "Lakshmi.C", "Yash.G", "Naina.H",
    "Kunal.A", "Maya.M", "Sunil.Z", "Praveen.R", "Mohit.T",
    "Ritika.I", "Gaurav.V", "Tushar.L", "Asmita.X",
    "Tarun.B", "Farhan.J", "Keerthi.D", "Sujay.C",
    "Harini.Y", "Sameer.O", "Diya.N", "Abhishek.F", "Kanika.H",
    "Vivek.G", "Esha.A", "Nitin.P", "Shraddha.M", "Imran.Z",
    "Shreya.T", "Parth.E", "Jhanvi.S", "Karthik.L", "Mehul.X",
    "Bhavya.V", "Aarav.B", "Trisha.I", "Yuvraj.J", "Rachna.C",
    "Rohini.W", "Dev.P", "Aditi.Q", "Santosh.N", "Madhuri.D",
    "Anirudh.F", "Juhi.Y", "Ranjit.M", "Charvi.T", "Ramesh.E",
    "Pallavi.K", "Armaan.H", "Vidya.O", "Abhinav.A", "Neelam.Z"
}

local listedNames = {
    "Siddharth.S", "Anjali.Q", "Priya.K", "Nivedita.K", "Meena.T"
}

local occupations = {
    "Algorithm Ethics Auditor", "Synthetic Identity Broker", "Deepfake Content Strategist",
    "Neural Experience Designer", "Biohacking Consultant", "Surveillance Countermeasure Specialist",
    "Cryptocurrency Laundering Advisor", "Autonomous Drone Swarm Operator", "AI Companion Trainer",
    "Black Market Data Miner", "Augmented Reality Blacksmith", "Neuro-Influencer", "Virtual Black Market Curator",
}

local listedOccupations = {
    "AI-Powered Scam Scriptwriter", "Genetic Profile Forger", "Cybernetic Implant Installer", "Digital Memory Dealer",
    "Emotion Manipulation Engineer", "Smart City Saboteur", "Quantum Encryption Cracker"
}

local sectorRegions = {
    "Neon Sprawl", "Ashen Heights", "Crimson Sector",
    "Vault City Delta", "Obsidian Ring", "Synth Hollow",
    "Carbon District", "Echo Basin", "Zircon Verge",
}

local listedSectorRegions = {
    "Echo Basin"
}

local crimes = {
    "Data Smuggling", "Synthetic ID Forgery", "Neural Implant Tampering", "Quantum Vault Breach",
    "AI Companion Hijacking", "Drone Swarm Interference", "Deepfake Extortion", "Surveillance Grid Hacking",
    "Biochip Counterfeiting", "Black Market Organ Trading", "Augmented Reality Vandalism", "Digital Memory Theft",
}

local listedCrimes = {
    "Genetic Code Tampering", "Cryptocurrency Laundering", "Emotion Exploit Trafficking", "Cybernetic Sabotage",
    "Smart City Power Hijack", "Virtual Arms Dealing", "Facial Recognition Spoofing", "Nano-Weapon Smuggling"
}

local identifications = {
    "Crimson Fang Emblem", "Obsidian Coil Tattoo", "Neon Vulture Sigil", "Ash Serpent Crest",
    "Void Lotus Ink", "Chrome Jackal Mark", "Black Circuit Rune", "Iron Halo Symbol",
    "Scarlet Shard Tattoo", "Ghost Grid Insignia", "Sable Phoenix Crest", "Cyber Wasp Glyph",
}

local listedIdentifications = {
    "Grime Wolf Ink", "Quantum Fang Coil", "Hellbyte Stamp", "Zircon Raven Emblem",
    "Carbon Eye Mark", "Midnight Thorn Crest", "Echo Skull Insignia", "Static Tiger Seal"
}

local function getRandomAndRemove(tbl)
    if #tbl == 0 then return nil end
    local index = math.random(#tbl)
    local value = tbl[index]
    table.remove(tbl, index)
    return value
end

local function getRandomDebiter()
    local name = names[math.random(#names)]
    local age = math.random(19, 43)
    local occupation = occupations[math.random(#occupations)]
    local sectorRegion = sectorRegions[math.random(#sectorRegions)]
    local crime = crimes[math.random(#crimes)]
    local identification = identifications[math.random(#identifications)]
    return {
        name = name,
        age = age,
        occupation = occupation,
        sectorRegion = sectorRegion,
        crime = crime,
        identification = identification,
    }
end

local function getRandomDay1Debiter(listedPool)
    return {
        name = getRandomAndRemove(listedPool.names),
        age = math.random(19, 43),
        occupation = listedOccupations[math.random(#listedOccupations)],
        sectorRegion = listedSectorRegions[math.random(#listedSectorRegions)],
        crime = listedCrimes[math.random(#listedCrimes)],
        identification = listedIdentifications[math.random(#listedIdentifications)]
    }
end

local function shuffle(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

function M.generateDay1Debiters(count, listedCount)
    local debiters = {}

    listedCount = math.min(listedCount, count)
    local listedPool = {
        names = { unpack(listedNames) },
        occupations = { unpack(listedOccupations) },
        sectorRegions = { unpack(listedSectorRegions) },
        crimes = { unpack(listedCrimes) },
        identifications = { unpack(listedIdentifications) },
    }

    for i = 1, listedCount do
        local debiter = getRandomDay1Debiter(listedPool)
        if debiter.name then
            table.insert(debiters, debiter)
        end
    end

    for i = 1, count - #debiters do
        table.insert(debiters, getRandomDebiter())
    end

    shuffle(debiters)

    return debiters
end

M.sectorRegions = sectorRegions
M.listedNames = listedNames

return M

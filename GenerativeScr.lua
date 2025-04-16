local M = {}

local names = {
    "Siddharth.S", "Arjun.V", "Priya.K", "Ravi.M", "Meena.T",
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
    "Ritika.I", "Gaurav.V", "Nivedita.K", "Tushar.L", "Asmita.X",
    "Tarun.B", "Anjali.Q", "Farhan.J", "Keerthi.D", "Sujay.C",
    "Harini.Y", "Sameer.O", "Diya.N", "Abhishek.F", "Kanika.H",
    "Vivek.G", "Esha.A", "Nitin.P", "Shraddha.M", "Imran.Z",
    "Shreya.T", "Parth.E", "Jhanvi.S", "Karthik.L", "Mehul.X",
    "Bhavya.V", "Aarav.B", "Trisha.I", "Yuvraj.J", "Rachna.C",
    "Rohini.W", "Dev.P", "Aditi.Q", "Santosh.N", "Madhuri.D",
    "Anirudh.F", "Juhi.Y", "Ranjit.M", "Charvi.T", "Ramesh.E",
    "Pallavi.K", "Armaan.H", "Vidya.O", "Abhinav.A", "Neelam.Z"
}


local occupations = {
    "Algorithm Ethics Auditor", "Synthetic Identity Broker", "Deepfake Content Strategist",
    "Neural Experience Designer", "Biohacking Consultant", "Surveillance Countermeasure Specialist",
    "Cryptocurrency Laundering Advisor", "Autonomous Drone Swarm Operator", "AI Companion Trainer",
    "Black Market Data Miner", "Augmented Reality Blacksmith", "Neuro-Influencer", "Virtual Black Market Curator",
    "AI-Powered Scam Scriptwriter", "Genetic Profile Forger", "Cybernetic Implant Installer", "Digital Memory Dealer",
    "Emotion Manipulation Engineer", "Smart City Saboteur", "Quantum Encryption Cracker"
}

local sectorRegions = {
    "Neon Sprawl", "Ashen Heights", "Crimson Sector",
    "Vault City Delta", "Obsidian Ring", "Synth Hollow",
    "Carbon District", "Echo Basin", "Zircon Verge",
    "Havoc Row", "Phantom Precinct", "Ironlight Core",
    "Nova Shard", "Grimegate Zone", "Circuit Haven"
}

local items = {
    "Vintage Watch", "Antique Vase", "Rare Coin", "Signed Baseball",
     "Oil Painting", "Comic Book", "Classic Car",
      "Old Map", "Diamond Ring", "Porcelain Doll",
       "Gold Necklace", "Silver Spoon Set", "Historic Document",
        "Luxury Handbag", "Retro Camera", "Collector's Stamp", "Medieval Sword",
         "Ceramic Statue", "Bronze Sculpture", "First Edition Book"
}

function getRandomDebiter()

    local name = names[math.random(#names)]
    local occupation = occupations[math.random(#occupations)]
    local sectorRegion = sectorRegions[math.random(#sectorRegions)]
    local item = items[math.random(#items)]

    return {
        name = name,
        occupation = occupation,
        sectorRegion = sectorRegion,
        item = item,
    }
end

function M.generateDay1Debiters(count)
    local debiters = {}
    for i = 1, count do
        table.insert(debiters, getRandomDebiter())
    end
    return debiters
end

M.items = items

return M

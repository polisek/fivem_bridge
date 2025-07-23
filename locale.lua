--[[
  _                     _      
 | |                   | |     
 | |     ___   ___ __ _| | ___ 
 | |    / _ \ / __/ _` | |/ _ \
 | |___| (_) | (_| (_| | |  __/
 |______\___/ \___\__,_|_|\___|
                               
]]--

BRIDGE.Locale = BRIDGE.Locale or {}

-- Default language
BRIDGE.Language = BRIDGE.Language or "en"

-- Locale data
local Locales = {
    en = {
        -- Peds System
        peds = {
            missing_ped_id_or_data = "^1[PLS_SECRET_ITEMS] createStaticPed: Missing pedId or data^0",
            missing_ped_model = "^1[PLS_SECRET_ITEMS] createStaticPed: Missing ped model^0",
            missing_ped_coords = "^1[PLS_SECRET_ITEMS] createStaticPed: Missing ped coordinates^0",
            static_ped_created = "^2[PLS_SECRET_ITEMS] Created static ped: %s^0",
            missing_ped_id = "^1[PLS_SECRET_ITEMS] deleteStaticPed: Missing pedId^0",
            ped_not_exists = "^1[PLS_SECRET_ITEMS] deleteStaticPed: Ped with ID '%s' doesn't exist^0",
            static_ped_deleted = "^2[PLS_SECRET_ITEMS] Deleted static ped: %s^0",
            render_distance_set = "^2[PLS_SECRET_ITEMS] Set render distance: %sm^0",
            invalid_render_distance = "^1[PLS_SECRET_ITEMS] Invalid render distance^0",
            all_peds_deleted = "^2[PLS_SECRET_ITEMS] All static peds have been deleted^0"
        },
        
        -- Framework System
        framework = {
            player_loaded = "PLS BRIDGE - Player loaded",
            society_money_not_supported = "[PLS_BRIDGE] SOCIETY MONEY OX not supported for now, please change to your system. BRIDGE/server/framework.lua - AddSocietyMoney"
        },
        
        -- Inventory System
        inventory = {
            stash_not_exist = "Stash doesn't exist! %s",
            operation_completed = "Done"
        },
        
        -- Target System
        target = {
            operation_completed = "Done"
        },
        
        -- General
        general = {
            enabled = "Enabled",
            disabled = "Disabled",
            success = "Success",
            error = "Error",
            warning = "Warning",
            info = "Info"
        }
    },
    
    cs = {
        -- Peds System
        peds = {
            missing_ped_id_or_data = "^1[PLS_SECRET_ITEMS] createStaticPed: Chybí pedId nebo data^0",
            missing_ped_model = "^1[PLS_SECRET_ITEMS] createStaticPed: Chybí model peda^0",
            missing_ped_coords = "^1[PLS_SECRET_ITEMS] createStaticPed: Chybí souřadnice peda^0",
            static_ped_created = "^2[PLS_SECRET_ITEMS] Vytvořen statický ped: %s^0",
            missing_ped_id = "^1[PLS_SECRET_ITEMS] deleteStaticPed: Chybí pedId^0",
            ped_not_exists = "^1[PLS_SECRET_ITEMS] deleteStaticPed: Ped s ID '%s' neexistuje^0",
            static_ped_deleted = "^2[PLS_SECRET_ITEMS] Smazán statický ped: %s^0",
            render_distance_set = "^2[PLS_SECRET_ITEMS] Nastavena render vzdálenost: %sm^0",
            invalid_render_distance = "^1[PLS_SECRET_ITEMS] Neplatná render vzdálenost^0",
            all_peds_deleted = "^2[PLS_SECRET_ITEMS] Všichni statičtí pedové byli smazáni^0"
        },
        
        -- Framework System
        framework = {
            player_loaded = "PLS BRIDGE - Hráč načten",
            society_money_not_supported = "[PLS_BRIDGE] SOCIETY MONEY OX není momentálně podporováno, prosím změňte na váš systém. BRIDGE/server/framework.lua - AddSocietyMoney"
        },
        
        -- Inventory System
        inventory = {
            stash_not_exist = "Stash neexistuje! %s",
            operation_completed = "Hotovo"
        },
        
        -- Target System
        target = {
            operation_completed = "Hotovo"
        },
        
        -- General
        general = {
            enabled = "Zapnuto",
            disabled = "Vypnuto",
            success = "Úspěch",
            error = "Chyba",
            warning = "Varování",
            info = "Info"
        }
    },
    
    de = {
        -- Peds System
        peds = {
            missing_ped_id_or_data = "^1[PLS_SECRET_ITEMS] createStaticPed: PedId oder Daten fehlen^0",
            missing_ped_model = "^1[PLS_SECRET_ITEMS] createStaticPed: Ped-Modell fehlt^0",
            missing_ped_coords = "^1[PLS_SECRET_ITEMS] createStaticPed: Ped-Koordinaten fehlen^0",
            static_ped_created = "^2[PLS_SECRET_ITEMS] Statischer Ped erstellt: %s^0",
            missing_ped_id = "^1[PLS_SECRET_ITEMS] deleteStaticPed: PedId fehlt^0",
            ped_not_exists = "^1[PLS_SECRET_ITEMS] deleteStaticPed: Ped mit ID '%s' existiert nicht^0",
            static_ped_deleted = "^2[PLS_SECRET_ITEMS] Statischer Ped gelöscht: %s^0",
            render_distance_set = "^2[PLS_SECRET_ITEMS] Render-Distanz gesetzt: %sm^0",
            invalid_render_distance = "^1[PLS_SECRET_ITEMS] Ungültige Render-Distanz^0",
            all_peds_deleted = "^2[PLS_SECRET_ITEMS] Alle statischen Peds wurden gelöscht^0"
        },
        
        -- Framework System
        framework = {
            player_loaded = "PLS BRIDGE - Spieler geladen",
            society_money_not_supported = "[PLS_BRIDGE] SOCIETY MONEY OX wird derzeit nicht unterstützt, bitte ändern Sie zu Ihrem System. BRIDGE/server/framework.lua - AddSocietyMoney"
        },
        
        -- Inventory System
        inventory = {
            stash_not_exist = "Stash existiert nicht! %s",
            operation_completed = "Fertig"
        },
        
        -- Target System
        target = {
            operation_completed = "Fertig"
        },
        
        -- General
        general = {
            enabled = "Aktiviert",
            disabled = "Deaktiviert",
            success = "Erfolg",
            error = "Fehler",
            warning = "Warnung",
            info = "Info"
        }
    },
    
    fr = {
        -- Peds System
        peds = {
            missing_ped_id_or_data = "^1[PLS_SECRET_ITEMS] createStaticPed: PedId ou données manquantes^0",
            missing_ped_model = "^1[PLS_SECRET_ITEMS] createStaticPed: Modèle de ped manquant^0",
            missing_ped_coords = "^1[PLS_SECRET_ITEMS] createStaticPed: Coordonnées du ped manquantes^0",
            static_ped_created = "^2[PLS_SECRET_ITEMS] Ped statique créé: %s^0",
            missing_ped_id = "^1[PLS_SECRET_ITEMS] deleteStaticPed: PedId manquant^0",
            ped_not_exists = "^1[PLS_SECRET_ITEMS] deleteStaticPed: Le ped avec l'ID '%s' n'existe pas^0",
            static_ped_deleted = "^2[PLS_SECRET_ITEMS] Ped statique supprimé: %s^0",
            render_distance_set = "^2[PLS_SECRET_ITEMS] Distance de rendu définie: %sm^0",
            invalid_render_distance = "^1[PLS_SECRET_ITEMS] Distance de rendu invalide^0",
            all_peds_deleted = "^2[PLS_SECRET_ITEMS] Tous les peds statiques ont été supprimés^0"
        },
        
        -- Framework System
        framework = {
            player_loaded = "PLS BRIDGE - Joueur chargé",
            society_money_not_supported = "[PLS_BRIDGE] SOCIETY MONEY OX n'est pas pris en charge pour le moment, veuillez changer pour votre système. BRIDGE/server/framework.lua - AddSocietyMoney"
        },
        
        -- Inventory System
        inventory = {
            stash_not_exist = "Le coffre n'existe pas! %s",
            operation_completed = "Terminé"
        },
        
        -- Target System
        target = {
            operation_completed = "Terminé"
        },
        
        -- General
        general = {
            enabled = "Activé",
            disabled = "Désactivé",
            success = "Succès",
            error = "Erreur",
            warning = "Avertissement",
            info = "Info"
        }
    }
}

--- Get localized string
--- @param category string Category of the string (peds, framework, inventory, target, general)
--- @param key string Key of the string
--- @param ... any Additional parameters for string formatting
--- @return string localized Localized string
function BRIDGE.Locale.Get(category, key, ...)
    local currentLang = BRIDGE.Language or "en"
    
    -- Fallback to English if language doesn't exist
    if not Locales[currentLang] then
        currentLang = "en"
    end
    
    -- Get the localized string
    local langData = Locales[currentLang]
    if not langData or not langData[category] or not langData[category][key] then
        -- Fallback to English
        langData = Locales["en"]
        if not langData or not langData[category] or not langData[category][key] then
            return "Missing locale: " .. category .. "." .. key
        end
    end
    
    local str = langData[category][key]
    
    -- Format string with parameters if provided
    if ... then
        return string.format(str, ...)
    end
    
    return str
end

--- Set current language
--- @param lang string Language code (en, cs, de, fr)
function BRIDGE.Locale.SetLanguage(lang)
    if Locales[lang] then
        BRIDGE.Language = lang
        if BRIDGE.Debug then
            print("^2[PLS_BRIDGE] Language set to: " .. lang .. "^0")
        end
    else
        if BRIDGE.Debug then
            print("^1[PLS_BRIDGE] Language '" .. lang .. "' not supported, using English^0")
        end
    end
end

--- Get available languages
--- @return table languages List of available language codes
function BRIDGE.Locale.GetAvailableLanguages()
    local languages = {}
    for lang, _ in pairs(Locales) do
        table.insert(languages, lang)
    end
    return languages
end

--- Add or update locale strings
--- @param lang string Language code
--- @param category string Category name
--- @param strings table Table of key-value pairs
function BRIDGE.Locale.AddStrings(lang, category, strings)
    if not Locales[lang] then
        Locales[lang] = {}
    end
    
    if not Locales[lang][category] then
        Locales[lang][category] = {}
    end
    
    for key, value in pairs(strings) do
        Locales[lang][category][key] = value
    end
    
    if BRIDGE.Debug then
        print("^2[PLS_BRIDGE] Added " .. #strings .. " strings to " .. lang .. "." .. category .. "^0")
    end
end

--- Shorthand function for getting localized strings
--- @param category string Category of the string
--- @param key string Key of the string
--- @param ... any Additional parameters for string formatting
--- @return string localized Localized string
function _L(category, key, ...)
    return BRIDGE.Locale.Get(category, key, ...)
end

-- Auto-detect language from server locale if available
CreateThread(function()
    Wait(1000) -- Wait for other systems to load
    
    -- Try to get locale from lib if available
    if lib and lib.getLocale then
        local detectedLang = lib.getLocale()
        if detectedLang then
            BRIDGE.Locale.SetLanguage(detectedLang)
        end
    end
end)

-- Export functions
exports('getLocaleString', BRIDGE.Locale.Get)
exports('setLanguage', BRIDGE.Locale.SetLanguage)
exports('getAvailableLanguages', BRIDGE.Locale.GetAvailableLanguages)
exports('addLocaleStrings', BRIDGE.Locale.AddStrings) 
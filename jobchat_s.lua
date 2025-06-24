-- ID des conversations  -- MAX 17

local lspd = 1
local ems = 2
local em_lspd = 3
local dir_ems = 4
local lsfs = 5
local em_lsfs = 6
local sheriff = 7
local em_sheriff = 8



-- Ajout au groupe

RegisterNetEvent("sao_jobchat:new", function(player)

    print(player)
    local src = player
    local citizenId = exports.qbx_core:GetPlayer(src).PlayerData.citizenid
    local phone_number = exports.qbx_core:GetPlayer(src).PlayerData.charinfo.phone
    local players = exports.qbx_core:GetQBPlayers()

        
    for _, v in pairs(players) do
  
    -- LSPD
    if v.PlayerData.job.type == 'leo' then -- check du job type 

        MySQL.single('SELECT id FROM npwd_messages_conversations WHERE id = ?', {lspd}, function(conversation)
            if conversation then
                local conversationId = conversation.id
    
                MySQL.scalar('SELECT COUNT(*) FROM npwd_messages_participants WHERE conversation_id = ? AND participant = ?', {
                    conversationId, phone_number
                }, function(isParticipant)
                    if isParticipant and isParticipant > 0 then
                        print(('Le joueur [%s] est déjà dans la conversation [%s].'):format(conversationId, phone_number))
                    else
                        -- Ajouter le joueur à la conversation
                        MySQL.insert('INSERT INTO npwd_messages_participants (conversation_id, participant) VALUES (?, ?)', {
                            conversationId, phone_number
                        }, function(rowsAffected)
                            if rowsAffected > 0 then
                             
                                -- On met un mail de bienvenue dans une entreprise générique ? Blabla tu viens d'être recruter tu as x truc en plus dans t'es contactes 

                            end
                        end)
                    end
                end)
            else
                print(('Aucune conversation associée au job [%s].'):format(lspd))
            end
        end)

    end
    -- EMS
    if v.PlayerData.job.type == 'ems' then -- check du job type 

        MySQL.single('SELECT id FROM npwd_messages_conversations WHERE id = ?', {ems}, function(conversation)
            if conversation then
                local conversationId = conversation.id
    
                MySQL.scalar('SELECT COUNT(*) FROM npwd_messages_participants WHERE conversation_id = ? AND participant = ?', {
                    conversationId, phone_number
                }, function(isParticipant)
                    if isParticipant and isParticipant > 0 then
                        print(('Le joueur [%s] est déjà dans la conversation [%s].'):format(conversationId, phone_number))
                    else
                        -- Ajouter le joueur à la conversation
                        MySQL.insert('INSERT INTO npwd_messages_participants (conversation_id, participant) VALUES (?, ?)', {
                            conversationId, phone_number
                        }, function(rowsAffected)
                            if rowsAffected > 0 then
                             
                                -- On met un mail de bienvenue dans une entreprise générique ? Blabla tu viens d'être recruter tu as x truc en plus dans t'es contactes 

                            end
                        end)
                    end
                end)
            else
                print(('Aucune conversation associée au job [%s].'):format(lspd))
            end
        end)

    end
  end
end)


--- Suppression du groupe 



RegisterNetEvent("sao_jobchat:retrait", function(players)
    print("penis")
    local src = players
    local citizenId = exports.qbx_core:GetPlayer(src).PlayerData.citizenid
    local phone_number = exports.qbx_core:GetPlayer(src).PlayerData.charinfo.phone
    local players = exports.qbx_core:GetQBPlayers()

        
    for _, v in pairs(players) do
        if v.PlayerData.job.type == 'leo' then -- check du job type 
            print("penis 2 ")

            MySQL.single('SELECT id FROM npwd_messages_conversations WHERE id = ?', {lspd}, function(conversation)
                if conversation then
                    local conversationId = conversation.id
        
                    MySQL.scalar('SELECT COUNT(*) FROM npwd_messages_participants WHERE conversation_id = ? AND participant = ?', {
                        conversationId, phone_number
                    }, function(isParticipant)
                        if isParticipant and isParticipant > 0 then
                            -- Retirer le joueur 
                            MySQL.update('DELETE FROM npwd_messages_participants WHERE conversation_id = ? AND participant = ?', {
                                conversationId, phone_number
                            }, function(rowsAffected)
                                if rowsAffected > 0 then
                                
                                    print(('Le joueur a bien été retiré .'):format(conversationId, phone_number))

                                end
                            end)
                        else
                            print('J\'ai pas trouvé chef')
                        end
                    end)
                else
                    print(('Aucune conversation associée au job [%s].'):format(lspd))
                end
            end)
        end
    end
end)

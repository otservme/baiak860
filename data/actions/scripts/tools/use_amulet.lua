function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 8269 then 
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
		doTransformItem(itemEx.uid, 8271)
		doRemoveItem(item.uid,1)
		setPlayerStorageValue(cid,50016,1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You are defeated.")
		return TRUE
	end
end
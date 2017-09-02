package com.bayan.keke.submail.lib.base;

import com.bayan.keke.submail.entity.DataStore;

public abstract class SenderWapper {

	protected DataStore requestData = new DataStore();

	public abstract ISender getSender();
}

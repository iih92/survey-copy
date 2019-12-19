package com.team.service;

import org.springframework.ui.Model;

public interface IReplyService {

	public void replySave(Model model);

	public void replySelect(Model model);

	public void reReplySave(Model model);

	public void replyDelete(Model model);

	public void replyUpdate(Model model);

}

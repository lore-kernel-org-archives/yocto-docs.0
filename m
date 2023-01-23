Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FB3C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 08:55:58 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.38547.1674464151675685464
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 00:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [10.2.0.7] (y254190.ppp.asahi-net.or.jp [118.243.254.190])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id A11D780312C4E;
	Mon, 23 Jan 2023 17:55:49 +0900 (JST)
Message-ID: <8ada8dc6-fb4b-5042-9fce-d0926d422226@lineo.co.jp>
Date: Mon, 23 Jan 2023 17:55:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: poky@lists.yoctoproject.org
Content-Language: en-US
From: Takayasu Ito <ito@lineo.co.jp>
Subject: yocto-3.1.22/RELEASENOTES
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jan 2023 08:55:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3620

I was checking the following RELEASENOTE contents, and the CVE for
cairo vulnerability has already been fixed in 2019 and the change in the 
PATCH file is that the status of the upstream PATCH has been changed 
from pending to backported.

http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.22/RELEASENOTES


-- 
Takayasu Ito
Yocto Project Ambassador
Solution Department Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp



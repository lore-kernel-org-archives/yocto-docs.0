Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D0FC25B6B
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 20:59:51 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.55256.1698267582449580874
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 13:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 39PKwcn0023708;
	Wed, 25 Oct 2023 15:58:38 -0500
Message-ID: <da900cde-800c-5b0e-80cb-199a93652b50@kernel.crashing.org>
Date: Wed, 25 Oct 2023 15:58:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Content-Language: en-US
To: docs@lists.yoctoproject.org
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Possible runqemu release note for Nanbield
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 20:59:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4503

While porting meta-xilinx to nanbield I ran into a difference with the way 
runqemu works.  I figure this might be something that should be a release note, 
but unfortunately I'm not sure I understand how to explain it well.  Below are 
my findings and maybe we can word-smith this into a proper release note.

In Mickledore and before 'runqemu' when run like:

runqemu nographic

would automatically add "-serial mon:stdio" after the QB_OPT_APPEND values as 
necessary.  (It might have also added "-serial null" in some cases, but after 
"-serial mon:stdio".). After the commit:

https://git.yoctoproject.org/poky/commit/?h=nanbield&id=8c4bb95c1c472f9eb5235b848e57febcac53aa59

This has changed to counting the number of serial ports and adding "-serial 
null" if the QB_OPT_APPEND only defined a single serial port, and if two or more 
ports are specified avoiding automatically adding -serial mon:stdio.  This can 
break some existing QEMU based configurations by changing the way the serial 
ports are automatically determined when runqemu is executed.

It may be necessary to compare a prior working (Mickledore) executing and 
adjusting QB_OPT_APPEND to include the correct ordering and number of serial 
ports of the emulated machine.



Hopefully Richard or someone can verify what I wrong about is accurate, and 
maybe adjust it to better explain how a user should adjust their BSP integration.

Thanks!

--Mark


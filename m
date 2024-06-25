Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFE1C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:32:49 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web11.176348.1719329567327255501
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 08:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=GUZxv6/X;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1719329563; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=EMdjiOcgIW0x5gXERR6Nig8He8/w44r+oho5HF/eL25U2Bpy9hFr0NqSWUAGRjoUoanVWBLIUpo80Iz7yQPoRywaW/SRc0SIa4WOvkIydo5q5zDaztpMxEHkw9C0bCEAqyc3VxzihCQBfWTD+D3XeENiBydUHxhHlWT8LBv8Fn8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1719329563; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Na+SG8PE+q0nF5M8bC0x2XQG8v0Y/200cPwyDIhgR1I=; 
	b=YVxlvsPDRY7jUiFYmFGOwYkasb0g5sObEHTG1lJPS0qS6XT5tkDiEuN4W4XPPTwl/e6rMfvE3pXYw3PjEvzbEsaps0iNz9qHH56I/snDsyuyyh3lGcbkbRW9Jt9LM5uG8B+IUD/bDaijcEHc8/GNqtuffLrAmg+3QvRPSqEzCe8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719329563;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Na+SG8PE+q0nF5M8bC0x2XQG8v0Y/200cPwyDIhgR1I=;
	b=GUZxv6/Xnrkud9/axxFZYdEGTnDnv3LF1j9N9DyNdB4fnGDQlqgWf9Zfrm3yifmh
	bzAFC9200Kq0EyyazXik+k6WPT3+w94Nh8CHSF9RA1AJPcUqmalNmG/k7i31bhPTQ0n
	qNoOG2in7YIt1AGuAGm1ONJaBTyg/7fAvU6aTWLw=
Received: by mx.zoho.eu with SMTPS id 1719329561007569.1533410568619;
	Tue, 25 Jun 2024 17:32:41 +0200 (CEST)
Message-ID: <a5bfbf72-e3b7-4a1c-9f1a-9f50486d7547@opdenacker.org>
Date: Tue, 25 Jun 2024 17:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, Lee Chee Yang <chee.yang.lee@intel.com>
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.19
From: Michael Opdenacker <michael@opdenacker.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240606013102.1462801-1-chee.yang.lee@intel.com>
 <17D66D486A5E0988.31248@lists.yoctoproject.org>
Content-Language: en-US
In-Reply-To: <17D66D486A5E0988.31248@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jun 2024 15:32:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5303

Hi Alexandre,

On 6/6/24 15:27, Michael Opdenacker wrote:
> Hi Lee,
>
> Thanks for the update!
>
> On 6/6/24 03:31, Lee Chee Yang wrote:
>> From: Lee Chee Yang <chee.yang.lee@intel.com>
>>
>> add release notes for 4.0.19.
>>
>> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
>> ---
>>   .../migration-guides/release-4.0.rst          |   1 +
>>   .../migration-guides/release-notes-4.0.19.rst | 159 ++++++++++++++++++
>>   2 files changed, 160 insertions(+)
>>   create mode 100644 
>> documentation/migration-guides/release-notes-4.0.19.rst
>
> Reviewed-by: Michael Opdenacker <michael@opdenacker.org>


This commit was merged into the "kirkstone" branch, but it should also 
be added to the "scarthgap" and "master" ones. For each branch that we 
support, the usual practice so far is to include the release notes 
corresponding to all previous releases plus the current one.
Cheers
Michael.



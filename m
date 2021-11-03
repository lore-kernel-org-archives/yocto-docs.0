Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2CAC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 14:19:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.8338.1635949194675485620
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 07:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A49196001C;
	Wed,  3 Nov 2021 14:19:52 +0000 (UTC)
Subject: Re: [docs] [hardknott][PATCH] documentation: prepare for 3.3.4
 release
To: Anuj Mittal <anuj.mittal@intel.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20211103071023.51887-1-anuj.mittal@intel.com>
 <c283050e-847c-e54a-fbfa-cb81f5a86365@bootlin.com>
 <4a07f7caa69fe09343d1e1f4e5ff6974fcf4c6d9.camel@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <b88a3915-a5c3-f6b6-f921-221753b01f83@bootlin.com>
Date: Wed, 3 Nov 2021 15:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4a07f7caa69fe09343d1e1f4e5ff6974fcf4c6d9.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Nov 2021 14:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2079

Hi Anuj,

On 11/3/21 2:54 PM, Anuj Mittal wrote:
> On Wed, 2021-11-03 at 09:56 +0100, Michael Opdenacker wrote:
>> Hi Anuj,
>>
>> On 11/3/21 8:10 AM, Anuj Mittal wrote:
>>> Also add a link for documentation to just released 3.1.11 release.
>>
>> Thanks. Merged into the "hardknott" branch:
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=hardknott
>> Who's supposed to add the tags by the way? Am I? I guess it's best to
>> wait for the release update to be made, in case we have updates until
>> then...
> You mean the release git tag? I think that one is created at the time
> of release along with other YP repositories by Vineela.


Right. Good to know, thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



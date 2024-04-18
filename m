Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C26EC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 14:47:49 +0000 (UTC)
Received: from www1.webmail.pair.com (www1.webmail.pair.com [209.68.6.94])
 by mx.groups.io with SMTP id smtpd.web10.177.1713451663631221608
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 07:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 209.68.6.94, mailfrom: bluelightning@bluelightning.org)
Received: from rc.webmail.pair.com (localhost [127.0.0.1])
	by www1.webmail.pair.com (Postfix) with ESMTP id 6968F1A0B9D;
	Thu, 18 Apr 2024 10:47:42 -0400 (EDT)
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 07:47:42 -0700
From: Paul Eggleton <bluelightning@bluelightning.org>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 7/9] release-notes: Add CVEs, recipe upgrades and
 contributors for 5.0
In-Reply-To: <b29fd95b-fa84-4fd6-8eeb-5ec08f66c4e7@bootlin.com>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <d0182baa07ca6bb009b845fcadb1f7fce81a38bd.1713127068.git.bluelightning@bluelightning.org>
 <b29fd95b-fa84-4fd6-8eeb-5ec08f66c4e7@bootlin.com>
Message-ID: <5f8f7c584f188422ac0fa7ba56a588b4@bluelightning.org>
X-Sender: bluelightning@bluelightning.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: mailmunge 3.09 on 209.68.6.94
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Apr 2024 14:47:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5162

Hi Michael

On 15.04.2024 07:24, Michael Opdenacker via lists.yoctoproject.org 
wrote:
>> diff --git a/documentation/migration-guides/release-notes-5.0.rst 
>> b/documentation/migration-guides/release-notes-5.0.rst
>> index 7767a4229d..21de79a638 100644
>> --- a/documentation/migration-guides/release-notes-5.0.rst
>> +++ b/documentation/migration-guides/release-notes-5.0.rst
>> @@ -264,16 +264,578 @@ The following corrections have been made to the 
>> :term:`LICENSE` values set by re
>>   Security Fixes in 5.0
>>   ~~~~~~~~~~~~~~~~~~~~~
>>   +-  avahi: :cve:`2023-1981`, :cve:`2023-38469-2`, 
>> :cve:`2023-38470-2`, :cve:`2023-38471-2`,
> 
> Oops, these last 3 don't work. For example, 
> https://nvd.nist.gov/vuln/detail/CVE-2023-38469-2 is invalid.
> 
> So, I replaced those with
> 
> :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`
> 
> I hope that's correct, as they still point to Avahi CVEs.

Oops, yes. Thanks.

>> :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, 
>> :cve:`2023-38472`, :cve:`2023-38473`
>> +-  bind: :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679`, 
>> :cve:`2023-50387`
>> +-  bluez5: :cve:`2023-45866`
>> +-  coreutils: :cve:`2024-0684`
>> +-  cups: :cve:`2023-4504`
>> +-  curl: :cve:`2023-46218`
>> +-  expat: :cve:`2024-28757`
>> +-  gcc: :cve:`2023-4039`
>> +-  glibc: :cve:`2023-5156`, :cve:`2023-0687`
>> +-  gnutls: :cve:`2024-0553`, :cve:`2024-0567`, :cve:`2024-28834`, 
>> :cve:`2024-28835`
>> +-  go: :cve:`2023-45288`
>> +-  grub: :cve:`2023-4692`, :cve:`2023-4693`
>> +-  grub2: :cve:`2023-4001` (ignored), :cve:`2024-1048` (ignored)
>> +-  libgit2: :cve:`2024-24575`, :cve:`2024-24577`
>> +-  libsndfile1: :cve:`2022-33065`
>> +-  libssh2: :cve:`2023-48795`
>> +-  libuv: :cve:`2024-24806`
>> +-  libxml2: :cve:`2023-45322` (ignored)
>> +-  linux-yocto/6.6: :cve:`2020-16119`
>> +-  openssh: :cve:`2023-48795`, :cve:`2023-51384`, :cve:`2023-51385`
>> +-  openssl: :cve:`2023-5363`, :cve:`2023-5678`, :cve:`2023-6129`, 
>> :cve:`2023-6237`, :cve:`2024-0727`
> 
> 
> I had to replace :cve:`2023-6237 by :cve_mitre:`2023-6237` as this was 
> a "reserved" CVE.

Thanks for checking these. I wonder if we can do this in an automated 
way (or do you have something that you use already?)

>>     Contributors to 5.0
>>   ~~~~~~~~~~~~~~~~~~~
>>     Thanks to the following people who contributed to this release:
>> ...
>> +-  Arne Schwerdt
>> +-  Bartosz Golaszewski
>> +-  Baruch Siach
>> +-  baruch@tkos.co.il
> 
> Removed that last line as this is the same person :)

Well spotted! I'm usually pretty good at finding those but somehow even 
after looking backwards and forwards I over the list I missed it.

Cheers
Paul


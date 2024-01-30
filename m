Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F1DC46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 20:56:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.8005.1706648164844121879
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jan 2024 12:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZGylORqv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15B9D60004;
	Tue, 30 Jan 2024 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706648162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ETVkVs2zNwKIjGSvGIVzb6fYYqhDuLu/45ih/AoB1Q=;
	b=ZGylORqvZzN5jPDtvVbuwqIZO/oerojga2THVM5fQelJ8oQXukdgm8qrnp1vJIc11su18t
	kIU2CC9yC6/uulYI6KG1GKtK2NumZTPMPfJ1xmcV3zqLsEP/QaniomC7cvPTF1h+SRjFVw
	pv5aay42N4pwMi4ARJNcawPPZcms8X/PJGPsYFbu2YxlcOIE7eEBsxVAyBVNJ5aDkeLoVD
	t74pwe0yWWwNYDi1+Hb0YF2WTggpjL6xIAJMmTxlGU5Xx1Znzh71I9HWpE0uleWM7J3YFK
	EjQ0aHjtkhr1l149Dz2BVhIyD5Xz3MBYo91uZ+WN90YuPELzGkL4neGkztstYg==
Message-ID: <6c7033a2-1215-49d2-8624-a79274953244@bootlin.com>
Date: Tue, 30 Jan 2024 21:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
To: chris.laplante@agilent.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
 <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <17AEEAA999A6674A.16647@lists.yoctoproject.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17AEEAA999A6674A.16647@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jan 2024 20:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4801

Chris, Michael, Richard,

On 1/29/24 at 21:15, Michael Opdenacker via lists.yoctoproject.org wrote:
> Greetings
>
> Thanks for this useful suggestion!
>
> On 1/25/24 at 18:43, Chris Laplante via lists.yoctoproject.org wrote:
>> Hi Richard,
>>
>>>> Is there any way we could add ‘noindex’ to old versions of docs so 
>>>> Google will
>>> stop crawling them? Or maybe add canconical links? Or something in 
>>> <head>.
>>>> I’d be willing to help out with this effort.
>>> I'd love to see this solved.
>>>
>>> It was partly one of the reasons we updated the docs in the first 
>>> place.
>>>
>>> I'm not sure what the right solution is but our docs repo and the 
>>> scripts we use
>>> to build the docs are all open and there are definitely possibilities.
>>>
>>> I'm not sure if any others have opinions on the best way to fix this?
>>> Personally, I'd welcome proposals though.
>> I'm also not an expert on search so definitely want to hear what 
>> others think. Noindex/canonical URLs are just what I came up with 
>> after cursory research.
>>
>> Perhaps whomever controls yoctoproject.org could also poke around in 
>> Google Search Console and see if there's something in there that can 
>> help?
>
> I did find the "noindex" tag 
> (https://developers.google.com/search/docs/crawling-indexing/block-indexing) 
> which we should be able to the HTML pages we generate through Sphinx 
> (https://docutils.sourceforge.io/docs/ref/rst/directives.html#meta).
>
> We should be able to add such a tag to obsolete manuals only, in the 
> corresponding branches.
>
> Let me try this.
>
> As far as the older versions before the switch to Sphinx are 
> concerned, a side-wide tag is probably an easier solution.


I managed to find a solution which works in Sphinx, but is not fully 
satisfactory. I have this patch:


8<--------

 From 3ff08381187ccadf0f239c126fe0ada99554ada7 Mon Sep 17 00:00:00 2001
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Tue, 30 Jan 2024 17:40:36 +0100
Subject: [PATCH] docs: conf.py: tell robots not to index this release

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Chris Laplante <chris.laplante@agilent.com>
CC: richard.purdie@linuxfoundation.org

This adds a header to all the generated HTML documents:
<meta content="noindex" name="robots" /> as described on
https://developers.google.com/search/docs/crawling-indexing/block-indexing

This tells search engines not to index the docs for
this no longer maintained release, to make search engine
results more relevant.

See the discussion on
https://lore.kernel.org/yocto-docs/DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com/T/#t
---
  documentation/conf.py | 1 +
  1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index a64685ec9b..18fa7a27a6 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -86,6 +86,7 @@ rst_prolog = """
  .. |project_name| replace:: %s
  .. |copyright| replace:: %s
  .. |author| replace:: %s
+.. meta:: :robots: noindex
  """ % (project, copyright, author)

  # external links and substitutions
-- 
2.34.1

------>8

However, this would be applied on the tip of the obsolete branches, and 
therefore wouldn't work with manuals for releases in such branches, 
which we still publish.

Another idea was to dynamically modify HTML directly from 
sphinx-static/switchers.js, as we do to warn about documentation for 
outdated releases. This way, we could leverage the existing logic. 
However, I'm reading that the web crawlers probably won't apply the JS 
code and just read the original HTML...

Michael H., would you have ideas?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AFCC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 17:29:37 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.1713.1739899776329147297
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 09:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 51IHNPMw001959;
	Tue, 18 Feb 2025 11:23:26 -0600
Received: from [192.168.2.30] ([192.168.2.30])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 51IHNODr008264;
	Tue, 18 Feb 2025 11:23:24 -0600
Message-ID: <8edb616e-f349-4a66-920c-5508868ec180@kernel.crashing.org>
Date: Tue, 18 Feb 2025 11:23:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on AI
 generated code
Content-Language: en-US
To: quentin.schulz@cherry.de, antonin.godard@bootlin.com,
        docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC <tsc@lists.yoctoproject.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
 <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 17:29:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6418



On 2/17/25 5:20 AM, Quentin Schulz via lists.openembedded.org wrote:
> HI Antonin,
> 
> On 2/12/25 9:50 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Based on message by Richard Purdie on the yocto-docs list:
>> https://lists.yoctoproject.org/g/docs/message/6300
>>
>> Re-formatted for the Yocto Project documentation syntax.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>    documentation/contributor-guide/submit-changes.rst | 49 ++++++++++++++++++++++
>>    1 file changed, 49 insertions(+)
>>
>> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
>> index 85ca987df..0675aac98 100644
>> --- a/documentation/contributor-guide/submit-changes.rst
>> +++ b/documentation/contributor-guide/submit-changes.rst
>> @@ -832,3 +832,52 @@ Other layers may have similar testing branches but there is no formal
>>    requirement or standard for these so please check the documentation for the
>>    layers you are contributing to.
>>    
>> +Acceptance of AI Generated Code
>> +===============================
>> +
>> +The Yocto Project and OpenEmbedded follow the guidance of the Linux Foundation
>> +in regards to the use of generative AI tools. See:
>> +https://www.linuxfoundation.org/legal/generative-ai.
>> +
>> +All of the existing guidelines in this document are expected to be followed,
> 
> s/in this document/in the document linked above/ ?
> 
> Since "this document" could be interpreted as the Yocto Docs, especially
> if shared in PDF/ePUB forms.

"this document", as in the 'contributor-guide', the document the user is 
currently reading as a whole,not just this section.

We only reference the generative-ai link.  We do NOT want to be beholden to an 
outside document, but we may reference it.

This matches what we've done with the kernel's developer statement of origin. 
We reference it and quote the relevant text we expect someone to follow.

> 
>> +including in the :doc:`recipe-style-guide`, and contributing the changes with
>> +additional requirements to the items in section
>> +:ref:`contributor-guide/submit-changes:Implement and commit changes`.
>> +
>> +All AI Generated Code must be labeled as such in the commit message,
>> +prior to your ``Signed-off-by`` line. It is also strongly recommended,
> 
> s/,//
> 
>> +that any patches or code within the commit also have a comment or other
> 
> s/patches/patch/
> 
> s/also// (redundant with "also strongly recommended" at the beginning of
> the sentence; or maybe start the sentence with "Additionally" or
> "Moreover" or "In addition")


Original text was 'It is recommended,"   This was changed to "It is also 
strongly recommended," to put clear emphasis that while not required, people 
will be looking for, and expecting this information.  Must/Require, 
Should/Recommended, etc are language I'm used to using from other standards 
documents.


>> +indication that this code was AI generated.
>> +
>> +For example, here is a properly formatted commit message::
>> +
>> +   component: Add the ability to ...
>> +
>> +   AI-Generated: Uses GitHub Copilot
>> +
>> +   Signed-off-by: Your Name <your.name@domain>
>> +
>> +The ``Signed-off-by`` line must be written by you, and not the AI helper.
>> +As a reminder, when contributing a change, your ``Signed-off-by`` line is
>> +required and the stipulations in the `Developer's Statement of Origin
>> +1.1 <https://developercertificate.org/>`__ still apply.
>> +
>> +Additionally, you must stipulate AI contributions conform to the Linux
>> +Foundation policy, specifically:
>> +
> 
> This is exactly the content of the link provided above. I'm not sure we
> should duplicate it? E.g. it could be updated and we could then have
> conflicting instructions there. Should we say which one takes precedence
> when there can be a conflict?

I believe Richard already covered this in his comments, but we absolute want a 
copy of anything we depend on from an outside source.

Only what is written in our contribution guide is required.  By making a copy, 
we ensure that if the outside source changes their recommendations, we are _NOT_ 
affected and our users are _NOT_ affected unless we specifically make changes.

--Mark

>> +#. Contributors should ensure that the terms and conditions of the generative AI
>> +   tool do not place any contractual restrictions on how the tool's output can
>> +   be used that are inconsistent with the project's open source software
>> +   license, the project's intellectual property policies, or the Open Source
>> +   Definition.
>> +
> 
> There's a link in the original link, provide it here too
> 
> `Open Source Definition<https://opensource.org/osd/>`__
> 
> Cheers,
> Quentin
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#612): https://lists.openembedded.org/g/tsc/message/612
> Mute This Topic: https://lists.openembedded.org/mt/111235974/3616948
> Group Owner: tsc+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/tsc/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


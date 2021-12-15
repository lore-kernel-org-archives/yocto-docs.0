Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD553C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.720.1639586448423497918
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 08:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oS4Kgi5c;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id u17so16900999plg.9
        for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=/Ah87INU60rmne1JdmmFlQl0VdePrpJFaHDHjlMtb0c=;
        b=oS4Kgi5ctkd+aMV2C2ZLVva+TQ2PrJl1Ds1ohvjmP7ZvHt+Perv36FOtpHYHWmX8qJ
         Uhw+sM4BKiLcLrEM3H0oRPv/ERJWf7Jm/KM32Der3hsf9PnJAUpEGp3i7UMn9erZT/iq
         wm7hG7H2l2vZdKE+748m0DUCEfvjvRXr3rEbu3b15sUBVpfb6NZGbTPHxXKFWkhLtd3k
         uLTb6e9i7tRgkRrnujoKKFKSYOy749O9sgTrs5len8WgSTkjOcUR9s5t4EiR8ldsXYiT
         BcfhwgLemBRnbwCYYNnerLuuY9u/Frd6ff5k51DTwBuq81Wmh0C+YDMpcxqofVLuec5J
         J+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=/Ah87INU60rmne1JdmmFlQl0VdePrpJFaHDHjlMtb0c=;
        b=4zzR/cIZtFvmqTo0d53gzrJ7AleYM0/aBViJvyZmCDBIEzx+8+iO8orfNcJfaqqpaq
         9jDRJxBoKQlkafUsdk5j7EX/tYilCbw9lXPwQPC5Z4WOT0MhtAqsFkbuyZUThvcMRWud
         60Cnirn1S7CEcWUmYNgdk89XXxBSubB6nun0X8XsdPn1F4lWzgiEEemHbzC2Gl7rj/cL
         7QtG6MG2S73mRAiuIVyt2aRyFVsANEt45SLEISjDbTegSdp5Ly1zDkQ5KZanWHoSWITe
         Tijn6+XVubJVxPFgLXHi+JlUNwcKZvKEuq5UZLWf2/hUtrUwvRcqBqohxGzMRCajuLfb
         IAbQ==
X-Gm-Message-State: AOAM531HOiIyETuD5t0Hkm+X6b8o4CoTgh3PX5Kd46TvLjWPRC1z3jzN
	pi8ejkyNl4zXaSVZCUp6dgM=
X-Google-Smtp-Source: 
 ABdhPJxjrnfMejuJUxoaS2IKEINFeFnzad5lL+0YCEllbJyKJb074q9mCIHvZcZUSfJgTVTjJns+ZA==
X-Received: by 2002:a17:902:a3c6:b0:148:9a04:620a with SMTP id
 q6-20020a170902a3c600b001489a04620amr7935077plb.58.1639586447751;
        Wed, 15 Dec 2021 08:40:47 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:cd09:406c:9104:34eb?
 ([2601:646:9200:a0f0:cd09:406c:9104:34eb])
        by smtp.gmail.com with ESMTPSA id
 fw21sm5841171pjb.25.2021.12.15.08.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:40:47 -0800 (PST)
Message-ID: <a4348909-960b-2d6f-211f-df7748d91956@gmail.com>
Date: Wed, 15 Dec 2021 08:40:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH 1/1] overview-manual: initial documentation for
 hash equivalence
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20211215091631.1989314-1-michael.opdenacker@bootlin.com>
 <20211215091631.1989314-2-michael.opdenacker@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211215091631.1989314-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:43:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2274



On 12/15/21 1:16 AM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/overview-manual/concepts.rst | 67 ++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index bfd54208af..873f43a66e 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1938,6 +1938,73 @@ another reason why a task-based approach is preferred over a
>   recipe-based approach, which would have to install the output from every
>   task.
>   
> +Hash Equivalence
> +----------------
> +
> +The above section explained how BitBake skips the execution of tasks
> +which output can already be found in the Shared State Cache.
> +
> +During a build, it may often be the case that the output / result of a task might
> +be unchanged despite changes in the task's input values. An example might be
> +whitespace changes in some input C code. In project terms, this is what we define
> +as "equivalence". We can create a hash / checksum which represents a task and two
> +input task hashes are said to be equivalent if the hash of the generated output
> +(as stored / restored by sstate) is the same.
> +
> +Once bitbake knows that two input hashes for a task have equivalent output,
> +this has important and useful implications for all tasks depending on this task.
> +
> +Thanks to this equivalence, a change in one of the tasks in BitBake's run queue
> +doesn't have to propagate to all the downstream tasks that depend on the output
> +of this task, causing a full rebuild of such tasks, and so on with the next
> +depending tasks. Instead, BitBake can safely retrieve all the downstream
> +task output from the Shared State Cache.
> +
> +This applies to multiple scenarios:
> +
> +-  A "trivial" change to a recipe that doesn't impact its generated output,
> +   such as whitespace changes, modifications to unused code paths or
> +   in the ordering of variables.
> +
> +-  Shared library updates, for example to fix a security vulnerability.
> +   For sure, the programs using such a library should be rebuilt, but
> +   their new binaries should remain identical. The corresponding tasks should
> +   have a different output hash because of the change in the hash of their
> +   library dependency, but thanks to their output being identical, hash
> +   equivalence will stop the propagation down the dependency chain.
> +

is this case working I wonder, and if it is then it would be good to 
expand on what limitations are, since all shared libs aren't made same
some follow symbol versioning some don't and it get quickly get murky

> +-  Native tool updates. Though the depending tasks should be rebuilt,
> +   it's likely that they will generate the same output and be marked
> +   as equivalent.
> +
> +This mechanism is enabled by default in Poky, and is controlled by two
> +variables:
> +
> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote hash
> +   equivalence server to use.
> +
> +-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
> +
> +Therefore, the default configuration in Poky corresponds to the
> +below settings::
> +
> +   BB_HASHSERVE = "auto"
> +   BB_SIGNATURE_HANDLER = "OEEquivHash"
> +
> +Another possibility is to share a hash equivalence server on a network,
> +by setting::
> +
> +   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
> +
> +.. note::
> +
> +   The hash equivalence server needs to be maintained together with the
> +   share state cache. Otherwise, the server could report shared state hashes
> +   that do not exist.
> +
> +   We therefore recommend that one hash equivalence server be set up to
> +   correspond with a given shared state cache.
> +
>   Automatically Added Runtime Dependencies
>   ========================================
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2265): https://lists.yoctoproject.org/g/docs/message/2265
> Mute This Topic: https://lists.yoctoproject.org/mt/87740819/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


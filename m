Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1427C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 11:11:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5303.1641553881593377186
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 03:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FBmgUQtV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 18-20020a05600c22d200b00347d3a13c7cso213946wmg.0
        for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CnJqBzLM9rd0Jba8hzTOFzY0P1JMRlspSOvjVDn7dVk=;
        b=FBmgUQtVg5DwzX4InHDb/gBafOzfsmhZrJtTolPWEiJzatOwBI+NQukvneEMt8lODh
         CIjGT7dLBTYGKcDvAXspWUCTgoH2Ef8HMJnzzIyGuKzezlasZPQcbk5iCI18xAsE9+7t
         0zIQwXLEUEKOCnRINtodc+waXQ/n6zq321vDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CnJqBzLM9rd0Jba8hzTOFzY0P1JMRlspSOvjVDn7dVk=;
        b=uQqJx0chf/rHDCGaKmnrtFRZFZ8705dBRJGDdY8U0Yr4urEtIVyEEbyl8uGG0/mrz9
         u0OIjzMtBzGO5kEGzumWCv22ZClohcau2zl8zeGWs6ZSk3IzHtrmtBnl04Y2GmR/lfJK
         c7xxuXQHYYMTCwZFVrS4s5fdwovox6YPyIjXMayTh4jZxnGESheWbIkYZ9dQRjtYtNjO
         H7yAZq85P8StVD2FYdyk82aChwV2EQMD9ZOiPyvEpy/vkNvzk+hV8vy++FI/ysdKMNht
         PtvrAN+PfowhIMmyTdPfbxf/hd0RTwfFhG87Y37loSizu1U2C9IHhlV48oncv3X/xxbW
         ca9Q==
X-Gm-Message-State: AOAM533RQV8a+Jpbby0CFpZDCrZjmajDtDyLmkNeltq7KHIBN+ZHvArG
	9Dk+bG+k4be8Xr1Q1eXB6iVTqw==
X-Google-Smtp-Source: 
 ABdhPJxdYV9XjajS7iuwYbidEgZtgnOoo7CZ30cs3lxC1rO5ET4uGwtq5GNjL9nESWGPWXGk2lmHJw==
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr10605947wmq.19.1641553879936;
        Fri, 07 Jan 2022 03:11:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:df67:6706:4d53:dd6b?
 ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 az25sm686531wmb.26.2022.01.07.03.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 03:11:19 -0800 (PST)
Message-ID: 
 <0d8e444ff5127484ecde2e04a7ef3b67d4b449c9.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] overview-manual: add details about hash
 equivalence
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Fri, 07 Jan 2022 11:11:17 +0000
In-Reply-To: <20211217171859.54664-1-michael.opdenacker@bootlin.com>
References: <20211217171859.54664-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jan 2022 11:11:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2353

On Fri, 2021-12-17 at 18:18 +0100, Michael Opdenacker wrote:
> In particular, mention the different hashes which are
> managed in Hash Equivalence mode: task hash, output hash and unihash.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/overview-manual/concepts.rst | 97 +++++++++++++++++-----
>  1 file changed, 76 insertions(+), 21 deletions(-)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 2d3d6f8040..2df5011ef6 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1942,19 +1942,60 @@ Hash Equivalence
>  ----------------
>  
>  The above section explained how BitBake skips the execution of tasks
> -which output can already be found in the Shared State Cache.
> +which output can already be found in the Shared State cache.
>  
>  During a build, it may often be the case that the output / result of a task might
>  be unchanged despite changes in the task's input values. An example might be
>  whitespace changes in some input C code. In project terms, this is what we define
> -as "equivalence". We can create a hash / checksum which represents a task and two
> -input task hashes are said to be equivalent if the hash of the generated output
> -(as stored / restored by sstate) is the same.
> -
> -Once bitbake knows that two input hashes for a task have equivalent output,
> -this has important and useful implications for all tasks depending on this task.
> -
> -Thanks to this equivalence, a change in one of the tasks in BitBake's run queue
> +as "equivalence".
> +
> +To keep track of such equivalence, BitBake has to manage three hashes
> +for each task:
> +
> +- The *task hash* explained earlier: computed from the recipe metadata,
> +  the task code and the task hash veported to be different, BitBake will update
+the task's unihash, causing the task hash of depending tasks to be
> +modified too, and making such tasks ralues from its dependencies.
> +  When changes are made, these task hashes are therefore modified,
> +  causing the task to re-execute. The task hashes of tasks depending on this
> +  task are therefore modified too, causing the whole dependency
> +  chain to re-execute.
> +
> +- The *output hash*, a new hash computed from the output of Shared State tasks,
> +  tasks that save their resulting output to a Shared State tarball.
> +  The mapping between the task hash and its output hash is reported
> +  to a new *Hash Equivalence* server. This mapping is stored in a database
> +  by the server for future reference.
> +
> +- The *unihash*, a new hash, initially set to the task hash for the task.
> +  This is used to track the *unicity* of task output, and we will explain
> +  how its value is maintained.
> +
> +When Hash Equivalence is enabled, BitBake computes the task hash
> +for each task by using the unihash of its dependencies, instead
> +of their task hash.
> +
> +Now, imagine that a Shared State task is modified because of a change in
> +its code or metadata, or because of a change in its dependencies.
> +Since this modifies its task hash, this task will need re-executing.
> +Its output hash will therefore be computed again.
> +
> +Then, the new mapping between the new task hash and its output hash
> +will be reported to the Hash Equivalence server. The server will
> +let BitBake know whether this output hash is the same as a previously
> +reported output hash, for a different task hash.
> +
> +If the output hash is reported to be different, BitBake will update
> +the task's unihash, causing the task hash of depending tasks to be
> +modified too, and making such tasks re-execute. This change is
> +propagating to the depending tasks.
>
> +On the contrary, if the output hash is reported to be identical
> +to the previously recorded output hash, BitBake will keep the
> +task's unihash unmodified. Thanks to this, the depending tasks
> +will keep the same task hash, and won't need re-executing. The
> +change is not propagating to the depending tasks.
> 

These paragraphs are reversed and this is an important detail to get right. The
output hash is always computed for a task that runs and the output hash is
queried on the hash equivalence server.

If the output hash is known, the unihash is updated to match the original input
hash that generated that output. If the output hash is unknown, a new entry is
created on the hash equivalence server matching that task hash to that output.

The unihash would therefore be unchanged for a new output hash and would update
if the output hash matched some other value already there.

Cheers,

Richard



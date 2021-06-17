Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.5408.1623962446571180004
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 13:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C5o7DgXC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso7230243wmg.2
        for <docs@lists.yoctoproject.org>; Thu, 17 Jun 2021 13:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jrip1d9GKfTwBA97fOon7HHaVjXCZCm+e8lGFjDR6og=;
        b=C5o7DgXC2GvYrHrJjPVd4bXaEyixJaYQKotv2LTXZu6MBrhV/6yBUKUY1zgpPZ/9P/
         mAUp+NqY2AXVsTWInjTwo6wq6qBLaFnGwMtPHrkS8/iJ/Os5rRampql1M6ksHtjQICrk
         5Ff8iPCM3vKtUgonS17/RQd/hc/W2ZmhFBA9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jrip1d9GKfTwBA97fOon7HHaVjXCZCm+e8lGFjDR6og=;
        b=umUGMjsM1w6CbC3qt/gsEOM41ASpVA6ZyU4CMuS7meSaS0EICXrQoU5fob8mAIpsYb
         1S7UTk1c1uxkcqDuR3XrJQ4uFa2WZO9/jqUr711eWs12+c/uS1ZOjHN/fabs5i5lY6Ns
         SgJI30bqB9Y/s6U9aQaXiX/qHE8Ztc1Myw1IKJiaKN8TOpHLwga9sHH2d5lZ7Jx8SOUn
         QpvzD0cvKko3cYYiNL7YbGzWK2q2oAImDyA/9IParSZ/RB/dhumFEKy2q6lTygPt1F00
         QdeTjAenTKpAIA5bl8HZ1bhOqm0VaIdtrsvdRiTg13mcm4LWYw6POSZlml4gkf5PcU5p
         Kvmw==
X-Gm-Message-State: AOAM531Uh76Sf0+61q72zJ+Myfeu0wgui4n+ZKdYN81WiGv+BSL5i3yw
	oF+zEd5I5HIB5gRvoDI6DjkFLA==
X-Google-Smtp-Source: ABdhPJx4kjlK8eLHHqeZHRPtIjyC2FWyPVdnhwa5CW5qhGIedOimcVn++fYBly5KMcKvDeAaXx/VgQ==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr7295930wmi.106.1623962444613;
        Thu, 17 Jun 2021 13:40:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d370:edcc:4e2d:7f3c? ([2001:8b0:aba:5f3c:d370:edcc:4e2d:7f3c])
        by smtp.gmail.com with ESMTPSA id j12sm6527966wrt.69.2021.06.17.13.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 13:40:44 -0700 (PDT)
Message-ID: <c387f7056fa5a182f564f9bf43f91111aae0dcb3.camel@linuxfoundation.org>
Subject: Re: [docs] [RFC 1/1] overview-manual: initial documentation for hash equivalence
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 JPEWhacker@gmail.com,  docs@lists.yoctoproject.org
Date: Thu, 17 Jun 2021 21:40:43 +0100
In-Reply-To: <20210617195530.258307-2-michael.opdenacker@bootlin.com>
References: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
	 <20210617195530.258307-2-michael.opdenacker@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Michael,

Thanks for starting this. I don't think the explanation is as clear as it 
needs to be. I've added some suggestions below on how to improve that. I'd 
also comment that when describing this, you need to be specific about which 
hash you refer to in all case. The task's hash for sstate purposes or the 
hash of it's output for example. There are too many hashes!

On Thu, 2021-06-17 at 21:55 +0200, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/overview-manual/concepts.rst | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index ab882ff778..bb8318ea46 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1950,6 +1950,69 @@ another reason why a task-based approach is preferred over a
>  recipe-based approach, which would have to install the output from every
>  task.
>  
> 
> +Hash Equivalence
> +----------------
> +
> +The above section explained how BitBake skips the execution of tasks
> +which output can already be found in the Shared State Cache.

I think here it may make sense to next define "equivalence", something like:

During a build, it may often be the case that the output/result of a task might 
be unchanged despite changes in the task's input values. An example might be 
whitespace changes some input C code. In project terms, this is what we define 
as "equivalence". We can create a hash/checksum which represents a task and two 
input task hashes are said to be equivalent if the hash of the generated output 
(as stored/restored by sstate) is the same.

You can then go on to say that this means:

> +BitBake can go beyond this and also skip the execution of tasks that,
> +even though the hash for their dependencies has changed, still generate
> +identical output.
> +
> +So, even if two executions of a given task can have a different hash,
> +because of potentially different sources, different environment variables
> +or different output hashes for the tasks they depend on, they can be considered
> +as "equivalent" as long as they generate the same output hash.

Once bitbake knows that two input hashes for a task have equivalent output, 
this has important and useful implications for all tasks depending on this task.


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

We therefore recommend that one hash equivalence server be setup to correspond 
with a given sstate cache.


Cheers,

Richard


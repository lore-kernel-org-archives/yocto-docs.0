Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0432C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 21:23:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14349.1641936195564489647
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 13:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KzWOIhhA;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id e5so246814wmq.1
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 13:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FmtFALyaDb+rmzQHJ+zEenXwlNKSIZz0ReQOv9q18BY=;
        b=KzWOIhhALScRvQr+jVvexmrd3TCQo20YNs3LNTjaPfL4kGT62YIqzTc9Hfw2IYq52f
         khFHvAXm1ulQi8Y3DBQTHg1pyjCmkiyy/o+sg8zZ6metMck991NYjIsV8QKOhRAiTvV1
         LIxNac6hnBnHsUVUorFAMSB/YvLer1DRMUAw7uxiZJHBJlHLz9D2xyukXHscbRenQQbz
         8d4FYZAb5TVnQ5VmQg6oIjfY/iGiO33HvEf9/xWUZHPM1dJ4HtRUw/8GmOW+zYC5i6On
         FsD20OFud6BW0/xh4RfVrxakXLKRj2bEh06Uz6tKdimTd38kJb5/tVWSdQjit8EKWI39
         mX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FmtFALyaDb+rmzQHJ+zEenXwlNKSIZz0ReQOv9q18BY=;
        b=SRZkgEbsz16bZXZNo/qvICmFPy8ih4kslzjQWlDQL37NciO+hXm24/OPSxNv5jeC48
         90Bm5HhDpDwAKcleK6vVWRPUfpHshXUax/uayOgLsDS9w1qESpyxSHcsfr/QGSTX0D2r
         Abj6MClmhRN8EhhN2Xh9lzwSd6SxnvHL7H6EjTG8znszpg20cw53MXu1fyknmwxeaZF5
         QomagSwisL+D6hEbwilEi5qsO2F909Zg4+GkrtU2kYhMzCWG+GDdXB+vjROC3fixaEWY
         1EfrC8uSg6PL+EQaoOWdbbCiB3dLEKR1v5P3kZCSAI7iXn5KfQDrBnH+gAVI7Jd4Rhry
         ycXQ==
X-Gm-Message-State: AOAM532vLA+A+IlX094pL4w5OJ09S9EbV9dxo140fGmDquEynYyUsHkU
	yGK1waUwKjA89iklhkZX02NQWIL5kS+p0Fyjv8I=
X-Google-Smtp-Source: 
 ABdhPJxZXluATGX+JIfJgI9ohwHi1y1yluH/ZgZTD2k+a111Q/TTCVYfWovLfyzZ6eO4b7HuuYTYrCIgJHYlkVvwIZU=
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr4027052wmq.112.1641936194008;
 Tue, 11 Jan 2022 13:23:14 -0800 (PST)
MIME-Version: 1.0
References: <16C812800894D4AC.11018@lists.yoctoproject.org>
 <20220107190840.784216-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20220107190840.784216-1-michael.opdenacker@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 11 Jan 2022 15:23:02 -0600
Message-ID: 
 <CAJdd5GZ06yJ2-sR+uKhT4uWqqKfOtf2+hv9nX3wwB1d773h-dg@mail.gmail.com>
Subject: Re: [docs] [PATCH V3] overview-manual: document hash equivalence
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 21:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2386

Micahel,

A few minor comments. I'm not sure if they add to the clarity of the
documentation, so feel free to omit any changes that are not helpful

On Fri, Jan 7, 2022 at 1:08 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/overview-manual/concepts.rst | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 6f8a3def69..781ba1b070 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1938,6 +1938,132 @@ another reason why a task-based approach is preferred over a
>  recipe-based approach, which would have to install the output from every
>  task.
>
> +Hash Equivalence
> +----------------
> +
> +The above section explained how BitBake skips the execution of tasks
> +which output can already be found in the Shared State cache.
> +
> +During a build, it may often be the case that the output / result of a task might
> +be unchanged despite changes in the task's input values. An example might be
> +whitespace changes in some input C code. In project terms, this is what we define
> +as "equivalence".
> +
> +To keep track of such equivalence, BitBake has to manage three hashes
> +for each task:
> +
> +- The *task hash* explained earlier: computed from the recipe metadata,
> +  the task code and the task hash values from its dependencies.
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

Is "unicity" a word? Would "equivalence" be better?

> +  how its value is maintained.
> +
> +When Hash Equivalence is enabled, BitBake computes the task hash
> +for each task by using the unihash of its dependencies, instead
> +of their task hash.

Mention that bitbake queries the hash equivalence server at parse time
to look up the unihash for each taskhash it knows about.... this is
cached, to speed up reparse but I don't know if that's worth
mentioning?

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
> +If the output hash is already known, BitBake will update the task's
> +unihash to match the original task hash that generated that output.

The server reports this by returning the desired unihash for the task
that just finished executing. If it is the same as the previous
unihash that bitbake new for the task, bitbake does nothing. If it is
a new unihash, bitbake propagates the change to the unihash through
the task graph

> +Thanks to this, the depending tasks will keep a previously recorded
> +task hash, and BitBake will be able to retrieve their output from
> +the Shared State cache, instead of re-executing them. Similarly, the
> +output of further downstream tasks can also be retrieved from Shared
> +Shate.
> +
> +If the output hash is unknown, a new entry will be created on the Hash
> +Equivalence server, matching the task hash to that output.
> +The depending tasks, still having a new task hash because of the
> +change, will need to re-execute as expected. The change propagates
> +to the depending tasks.
> +
> +To summarize, when Hash Equivalence is enabled, a change in one of the
> +tasks in BitBake's run queue doesn't have to propagate to all the
> +downstream tasks that depend on the output of this task, causing a
> +full rebuild of such tasks, and so on with the next depending tasks.
> +Instead, when the output of this task remains identical to previously
> +recorded output, BitBake can safely retrieve all the downstream
> +task output from the Shared State cache.
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
> +   library dependency, but thanks to their output being identical, Hash
> +   Equivalence will stop the propagation down the dependency chain.
> +
> +-  Native tool updates. Though the depending tasks should be rebuilt,
> +   it's likely that they will generate the same output and be marked
> +   as equivalent.
> +
> +This mechanism is enabled by default in Poky, and is controlled by three
> +variables:
> +
> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
> +   Equivalence server to use.
> +
> +-  :term:`BB_HASHSERVE_UPSTREAM`, when ``BB_HASHSERVE = "auto"``,
> +   allowing to connect the local server to an upstream one.
> +
> +-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
> +
> +Therefore, the default configuration in Poky corresponds to the
> +below settings::
> +
> +   BB_HASHSERVE = "auto"
> +   BB_SIGNATURE_HANDLER = "OEEquivHash"
> +
> +Rather than starting a local server, another possibility is to rely
> +on a Hash Equivalence server on a network, by setting::
> +
> +   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
> +
> +.. note::
> +
> +   The shared Hash Equivalence server needs to be maintained together with the
> +   Share State cache. Otherwise, the server could report Shared State hashes
> +   that only exist on specific clients.
> +
> +   We therefore recommend that one Hash Equivalence server be set up to
> +   correspond with a given Shared State cache, and to start this server
> +   in *read-only mode*, so that it doesn't store equivalences for
> +   Shared State caches that are local to clients.

I think this could be a little more clear, like: If you have an sstate
cache that you are using as a read-only mirror (e.g. using
SSTATE_MIRRORS) that was generated using hash equivalence, you should
also publish the hash equivalence database using a read-only hash
equiv server, otherwise you will get very poor sstate use from the
mirror.

> +
> +   See the :term:`BB_HASHSERVE` reference for details about starting
> +   a Hash Equivalence server.
> +
> +See the `video <https://www.youtube.com/watch?v=zXEdqGS62Wc>`__
> +of Joshua Watt's `Hash Equivalence and Reproducible Builds
> +<https://elinux.org/images/3/37/Hash_Equivalence_and_Reproducible_Builds.pdf>`__
> +presentation at ELC 2020 for a very synthetic introduction to the
> +Hash Equivalence implementation in the Yocto Project.
> +
>  Automatically Added Runtime Dependencies
>  ========================================
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2360): https://lists.yoctoproject.org/g/docs/message/2360
> Mute This Topic: https://lists.yoctoproject.org/mt/88268729/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B93C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 17:17:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.11723.1642094252925056775
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 09:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n4FJKSfp;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d19so11496158wrb.0
        for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 09:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNQighnMdfcXsLSc8DlUJ8pi9R+ksB/aam4X26v82OE=;
        b=n4FJKSfpMO3hEIo6pvMlDjLtJcUCvc0AKoplKLtwG+gBzjNiUmpn6k184OFz9zk6F3
         QChDoqjL1eylFAU2IKPgZ7941bdU590SXTJU6J+ypJ4CPukLHFWvG5JsutEWh077p/F2
         PI1WjF1LBU5TT/h61zXAQwNwY8ZjI7xDXYpR3f8cxM44EjGADjVgUAPBj5U1zIGln1ka
         /R1qsg9x8aPB6IE72Vi2G3xITo/p2O942pzEwvIU9sLe71A5UCGTi/CU0oZcg69Juxn3
         ImmA6Fy2bqLIY6hgymVA9gfDlzeq7lN/5YYY6otz59w6UP3PkMqXvh60pEQ8PJYOiuYZ
         +FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNQighnMdfcXsLSc8DlUJ8pi9R+ksB/aam4X26v82OE=;
        b=pw2dTuULO5pKELPpIsN4UfbzLVrd487p4uJZ7TDx7Bsqh2O+rl72f76bmgsWZsC1Fa
         yrS4vkTrgfmHeR+Hm44lkMokDtGvKEpJcv43eNsJCiVvVkcFeImoSabQE8dTKekaMUhC
         Fve2+RzlkJLwUvH6zxV33IU1eL4HQ4fHYFwE5kM+F4yDkHE2QhjfHeq0tgajOdrQRdoD
         iSVZCgw2V7qa0Rb8vcMcbHKpfA6PFiqlGdKizSwy9SdliVfgkWdcHio6OXJl7J/Uw1kM
         2kfadGEQEnkbCvky5IHIJNhil0a9dcyZiz9+4Vk6jYg16kAzcy//9O4sxX2peNrnnJTA
         37MQ==
X-Gm-Message-State: AOAM531cJ8B6/uRR65yjZOiVBPI6uKL7khFhjinFDuAI7KKkmdx75qhF
	6G2jX+Bcde2sN6JtuLwEEuGIXlc7LPvst+H8Jvs=
X-Google-Smtp-Source: 
 ABdhPJyZUoGfR+ewtxMIiarhOj7OmPM/y4RLwq+HzjltMadOIupKhH9uMh7HRHxz/kAmjOdCubxUTxx2betaX3/EIpI=
X-Received: by 2002:adf:fc45:: with SMTP id e5mr3044538wrs.248.1642094251295;
 Thu, 13 Jan 2022 09:17:31 -0800 (PST)
MIME-Version: 1.0
References: <16C812800894D4AC.11018@lists.yoctoproject.org>
 <20220107190840.784216-1-michael.opdenacker@bootlin.com>
 <CAJdd5GZ06yJ2-sR+uKhT4uWqqKfOtf2+hv9nX3wwB1d773h-dg@mail.gmail.com>
 <00189a62-ccd4-3daa-6118-42c005c653b4@bootlin.com>
In-Reply-To: <00189a62-ccd4-3daa-6118-42c005c653b4@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 13 Jan 2022 11:17:19 -0600
Message-ID: 
 <CAJdd5Ga8ehhZLF1sQjNaqYtg2dVW+wFZmxdLj=vFbSCTrw4Qag@mail.gmail.com>
Subject: Re: [docs] [PATCH V3] overview-manual: document hash equivalence
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 17:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2409

On Thu, Jan 13, 2022 at 4:50 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Joshua,
>
> Many thanks for the review. See my comments below...
>
> On 1/11/22 10:23 PM, Joshua Watt wrote:
> >
> >> +
> >> +- The *unihash*, a new hash, initially set to the task hash for the task.
> >> +  This is used to track the *unicity* of task output, and we will explain
> > Is "unicity" a word? Would "equivalence" be better?
>
>
> Well, yes, I found it in my 50-year old Oxford dictionary. However, it
> sounds rare. What about "uniqueness" instead?
> By the way, I wanted to help to understand and remember why this hash is
> called "unihash". Didn't you have the word "unique" in mind when you
> coined the term?

If memory serves it was "unified hash", the idea being that it
"unifies" multiple taskhashes together; I suppose in a sense it is
"unique".... I'm not really hung up on the name so much as how clearly
it's documented to the end user.

>
> >
> >> +  how its value is maintained.
> >> +
> >> +When Hash Equivalence is enabled, BitBake computes the task hash
> >> +for each task by using the unihash of its dependencies, instead
> >> +of their task hash.
> > Mention that bitbake queries the hash equivalence server at parse time
> > to look up the unihash for each taskhash it knows about.... this is
> > cached, to speed up reparse but I don't know if that's worth
> > mentioning?
>
>
> This could be useful indeed. Actually, my current description only says
> that the hash equivalence server stores the mapping between an output
> hash and a task hash. How is the unihash stored?

I'll describe it in some detail, and you can distill it down to the
important parts for documentation:

The server supports 2 operations. The first operation is a query to
decide what unihash should be used in place of a given taskhash
whenever bitbake doesn't already know (for example, during parsing).
we can call this operation "GET", and it looks like:

GET(taskhash) -> unihash

Every unique taskhash maps to only one unihash, but multiple taskhash
can map to the same unihash. The server tries to make sure the mapping
of a taskhash to unihash is consistent across time (that is, it won't
be different at a later query), but this is not guaranteed.


The second operation the server supports is reporting a new output
hash that corresponds to a given taskhash, and is called after sstate
generation (since that is when the outhash is known). This method will
return the (potentially new) unihash that corresponds to the given
taskhash. We can all this "REPORT" and it looks like:

REPORT(taskhash, outhash) -> unihash

The server will identify reports that have the same output hash, and
modify its state so that the taskhashes that correspond to those
outhashes report the same unihash, thereby making them equivalent.

>
> >
> >> +
> >> +Now, imagine that a Shared State task is modified because of a change in
> >> +its code or metadata, or because of a change in its dependencies.
> >> +Since this modifies its task hash, this task will need re-executing.
> >> +Its output hash will therefore be computed again.
> >> +
> >> +Then, the new mapping between the new task hash and its output hash
> >> +will be reported to the Hash Equivalence server. The server will
> >> +let BitBake know whether this output hash is the same as a previously
> >> +reported output hash, for a different task hash.
> >>> +
> >>> +   See the :term:`BB_HASHSERVE` reference for details about starting
> >>> +   a Hash Equivalence server.
> >>> +
> >>> +See the `video <https://www.youtube.com/watch?v=zXEdqGS62Wc>`__
> >>> +of Joshua Watt's `Hash Equivalence and Reproducible Builds
> >>> +<https://elinux.org/images/3/37/Hash_Equivalence_and_Reproducible_Builds.pdf>`__
> >>> +presentation at ELC 2020 for a very synthetic introduction to the
> >>> +Hash Equivalence implementation in the Yocto Project.
> >>> +
> >>>  Automatically Added Runtime Dependencies
> >>>  ========================================
> >>>
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#2386): https://lists.yoctoproject.org/g/docs/message/2386
> >>> Mute This Topic: https://lists.yoctoproject.org/mt/88268729/1051844
> >>> Group Owner: docs+owner@lists.yoctoproject.org
> >>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [michael.opdenacker@bootlin.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>
> >> +
> >> +If the output hash is already known, BitBake will update the task's
> >> +unihash to match the original task hash that generated that output.
> > The server reports this by returning the desired unihash for the task
> > that just finished executing. If it is the same as the previous
> > unihash that bitbake new for the task, bitbake does nothing. If it is
> > a new unihash, bitbake propagates the change to the unihash through
> > the task graph
>
>
> Well, I assume you could get a unihash that's not the previous unihash,
> but a former one, right?
> I tried to catch this case in the V4 of my patch which got merged:
> https://git.yoctoproject.org/yocto-docs/tree/documentation/overview-manual/concepts.rst#n1986
>
> Anyway, in the light of your explanations, my text looks incorrect
> because I'm saying that it's the output hash that gets compared, not the
> unihash.

Hopefully the above description is helpful: it's important to remember
that bitbake itself doesn't really "compare" for the purposes of
determining equivalence, it's just using the 2 operations above and
doing what the server says; the server drives the determination of
what's considered "equivalent".

Bitbake will compare the output of the REPORT operation to the
previous unihash it had for the input taskhash, but the purpose of
that is to determine if it needs to reconstruct the taskgraph with the
new unihash, not to decide "equivalence"


Hopefully that all helps. If you want more clarification, let me know
and I can provide it.

>
> >
> >> +Thanks to this, the depending tasks will keep a previously recorded
> >> +task hash, and BitBake will be able to retrieve their output from
> >> +the Shared State cache, instead of re-executing them. Similarly, the
> >> +output of further downstream tasks can also be retrieved from Shared
> >> +Shate.
> >> +
> >> +If the output hash is unknown, a new entry will be created on the Hash
> >> +Equivalence server, matching the task hash to that output.
> >> +The depending tasks, still having a new task hash because of the
> >> +change, will need to re-execute as expected. The change propagates
> >> +to the depending tasks.
> >> +
> >> +To summarize, when Hash Equivalence is enabled, a change in one of the
> >> +tasks in BitBake's run queue doesn't have to propagate to all the
> >> +downstream tasks that depend on the output of this task, causing a
> >> +full rebuild of such tasks, and so on with the next depending tasks.
> >> +Instead, when the output of this task remains identical to previously
> >> +recorded output, BitBake can safely retrieve all the downstream
> >> +task output from the Shared State cache.
> >> +
> >> +This applies to multiple scenarios:
> >> +
> >> +-  A "trivial" change to a recipe that doesn't impact its generated output,
> >> +   such as whitespace changes, modifications to unused code paths or
> >> +   in the ordering of variables.
> >> +
> >> +-  Shared library updates, for example to fix a security vulnerability.
> >> +   For sure, the programs using such a library should be rebuilt, but
> >> +   their new binaries should remain identical. The corresponding tasks should
> >> +   have a different output hash because of the change in the hash of their
> >> +   library dependency, but thanks to their output being identical, Hash
> >> +   Equivalence will stop the propagation down the dependency chain.
> >> +
> >> +-  Native tool updates. Though the depending tasks should be rebuilt,
> >> +   it's likely that they will generate the same output and be marked
> >> +   as equivalent.
> >> +
> >> +This mechanism is enabled by default in Poky, and is controlled by three
> >> +variables:
> >> +
> >> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
> >> +   Equivalence server to use.
> >> +
> >> +-  :term:`BB_HASHSERVE_UPSTREAM`, when ``BB_HASHSERVE = "auto"``,
> >> +   allowing to connect the local server to an upstream one.
> >> +
> >> +-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
> >> +
> >> +Therefore, the default configuration in Poky corresponds to the
> >> +below settings::
> >> +
> >> +   BB_HASHSERVE = "auto"
> >> +   BB_SIGNATURE_HANDLER = "OEEquivHash"
> >> +
> >> +Rather than starting a local server, another possibility is to rely
> >> +on a Hash Equivalence server on a network, by setting::
> >> +
> >> +   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
> >> +
> >> +.. note::
> >> +
> >> +   The shared Hash Equivalence server needs to be maintained together with the
> >> +   Share State cache. Otherwise, the server could report Shared State hashes
> >> +   that only exist on specific clients.
> >> +
> >> +   We therefore recommend that one Hash Equivalence server be set up to
> >> +   correspond with a given Shared State cache, and to start this server
> >> +   in *read-only mode*, so that it doesn't store equivalences for
> >> +   Shared State caches that are local to clients.
> > I think this could be a little more clear, like: If you have an sstate
> > cache that you are using as a read-only mirror (e.g. using
> > SSTATE_MIRRORS) that was generated using hash equivalence, you should
> > also publish the hash equivalence database using a read-only hash
> > equiv server, otherwise you will get very poor sstate use from the
> > mirror.
>
> This sounds better indeed, thanks. I'll update this note.
> Thanks again, and thanks in advance for the few clarifications about how
> the unihash is stored.
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


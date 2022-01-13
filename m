Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7B5C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 10:50:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7407.1642071015860025744
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 02:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4DD0E1C001A;
	Thu, 13 Jan 2022 10:50:13 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH V3] overview-manual: document hash equivalence
To: Joshua Watt <JPEWhacker@gmail.com>
References: <16C812800894D4AC.11018@lists.yoctoproject.org>
 <20220107190840.784216-1-michael.opdenacker@bootlin.com>
 <CAJdd5GZ06yJ2-sR+uKhT4uWqqKfOtf2+hv9nX3wwB1d773h-dg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <00189a62-ccd4-3daa-6118-42c005c653b4@bootlin.com>
Date: Thu, 13 Jan 2022 11:50:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAJdd5GZ06yJ2-sR+uKhT4uWqqKfOtf2+hv9nX3wwB1d773h-dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 10:50:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2405

Hi Joshua,

Many thanks for the review. See my comments below...

On 1/11/22 10:23 PM, Joshua Watt wrote:
>
>> +
>> +- The *unihash*, a new hash, initially set to the task hash for the task.
>> +  This is used to track the *unicity* of task output, and we will explain
> Is "unicity" a word? Would "equivalence" be better?


Well, yes, I found it in my 50-year old Oxford dictionary. However, it
sounds rare. What about "uniqueness" instead?
By the way, I wanted to help to understand and remember why this hash is
called "unihash". Didn't you have the word "unique" in mind when you
coined the term?

>
>> +  how its value is maintained.
>> +
>> +When Hash Equivalence is enabled, BitBake computes the task hash
>> +for each task by using the unihash of its dependencies, instead
>> +of their task hash.
> Mention that bitbake queries the hash equivalence server at parse time
> to look up the unihash for each taskhash it knows about.... this is
> cached, to speed up reparse but I don't know if that's worth
> mentioning?


This could be useful indeed. Actually, my current description only says
that the hash equivalence server stores the mapping between an output
hash and a task hash. How is the unihash stored?

>
>> +
>> +Now, imagine that a Shared State task is modified because of a change in
>> +its code or metadata, or because of a change in its dependencies.
>> +Since this modifies its task hash, this task will need re-executing.
>> +Its output hash will therefore be computed again.
>> +
>> +Then, the new mapping between the new task hash and its output hash
>> +will be reported to the Hash Equivalence server. The server will
>> +let BitBake know whether this output hash is the same as a previously
>> +reported output hash, for a different task hash.
>>> +
>>> +   See the :term:`BB_HASHSERVE` reference for details about starting
>>> +   a Hash Equivalence server.
>>> +
>>> +See the `video <https://www.youtube.com/watch?v=zXEdqGS62Wc>`__
>>> +of Joshua Watt's `Hash Equivalence and Reproducible Builds
>>> +<https://elinux.org/images/3/37/Hash_Equivalence_and_Reproducible_Builds.pdf>`__
>>> +presentation at ELC 2020 for a very synthetic introduction to the
>>> +Hash Equivalence implementation in the Yocto Project.
>>> +
>>>  Automatically Added Runtime Dependencies
>>>  ========================================
>>>
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#2386): https://lists.yoctoproject.org/g/docs/message/2386
>>> Mute This Topic: https://lists.yoctoproject.org/mt/88268729/1051844
>>> Group Owner: docs+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [michael.opdenacker@bootlin.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>> +
>> +If the output hash is already known, BitBake will update the task's
>> +unihash to match the original task hash that generated that output.
> The server reports this by returning the desired unihash for the task
> that just finished executing. If it is the same as the previous
> unihash that bitbake new for the task, bitbake does nothing. If it is
> a new unihash, bitbake propagates the change to the unihash through
> the task graph


Well, I assume you could get a unihash that's not the previous unihash,
but a former one, right?
I tried to catch this case in the V4 of my patch which got merged:
https://git.yoctoproject.org/yocto-docs/tree/documentation/overview-manual/concepts.rst#n1986

Anyway, in the light of your explanations, my text looks incorrect
because I'm saying that it's the output hash that gets compared, not the
unihash.

>
>> +Thanks to this, the depending tasks will keep a previously recorded
>> +task hash, and BitBake will be able to retrieve their output from
>> +the Shared State cache, instead of re-executing them. Similarly, the
>> +output of further downstream tasks can also be retrieved from Shared
>> +Shate.
>> +
>> +If the output hash is unknown, a new entry will be created on the Hash
>> +Equivalence server, matching the task hash to that output.
>> +The depending tasks, still having a new task hash because of the
>> +change, will need to re-execute as expected. The change propagates
>> +to the depending tasks.
>> +
>> +To summarize, when Hash Equivalence is enabled, a change in one of the
>> +tasks in BitBake's run queue doesn't have to propagate to all the
>> +downstream tasks that depend on the output of this task, causing a
>> +full rebuild of such tasks, and so on with the next depending tasks.
>> +Instead, when the output of this task remains identical to previously
>> +recorded output, BitBake can safely retrieve all the downstream
>> +task output from the Shared State cache.
>> +
>> +This applies to multiple scenarios:
>> +
>> +-  A "trivial" change to a recipe that doesn't impact its generated output,
>> +   such as whitespace changes, modifications to unused code paths or
>> +   in the ordering of variables.
>> +
>> +-  Shared library updates, for example to fix a security vulnerability.
>> +   For sure, the programs using such a library should be rebuilt, but
>> +   their new binaries should remain identical. The corresponding tasks should
>> +   have a different output hash because of the change in the hash of their
>> +   library dependency, but thanks to their output being identical, Hash
>> +   Equivalence will stop the propagation down the dependency chain.
>> +
>> +-  Native tool updates. Though the depending tasks should be rebuilt,
>> +   it's likely that they will generate the same output and be marked
>> +   as equivalent.
>> +
>> +This mechanism is enabled by default in Poky, and is controlled by three
>> +variables:
>> +
>> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
>> +   Equivalence server to use.
>> +
>> +-  :term:`BB_HASHSERVE_UPSTREAM`, when ``BB_HASHSERVE = "auto"``,
>> +   allowing to connect the local server to an upstream one.
>> +
>> +-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
>> +
>> +Therefore, the default configuration in Poky corresponds to the
>> +below settings::
>> +
>> +   BB_HASHSERVE = "auto"
>> +   BB_SIGNATURE_HANDLER = "OEEquivHash"
>> +
>> +Rather than starting a local server, another possibility is to rely
>> +on a Hash Equivalence server on a network, by setting::
>> +
>> +   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
>> +
>> +.. note::
>> +
>> +   The shared Hash Equivalence server needs to be maintained together with the
>> +   Share State cache. Otherwise, the server could report Shared State hashes
>> +   that only exist on specific clients.
>> +
>> +   We therefore recommend that one Hash Equivalence server be set up to
>> +   correspond with a given Shared State cache, and to start this server
>> +   in *read-only mode*, so that it doesn't store equivalences for
>> +   Shared State caches that are local to clients.
> I think this could be a little more clear, like: If you have an sstate
> cache that you are using as a read-only mirror (e.g. using
> SSTATE_MIRRORS) that was generated using hash equivalence, you should
> also publish the hash equivalence database using a read-only hash
> equiv server, otherwise you will get very poor sstate use from the
> mirror.

This sounds better indeed, thanks. I'll update this note.
Thanks again, and thanks in advance for the few clarifications about how
the unihash is stored.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



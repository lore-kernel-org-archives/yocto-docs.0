Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.10542.1624035332072053783
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 09:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1E60E20004;
	Fri, 18 Jun 2021 16:55:29 +0000 (UTC)
Subject: Re: [docs] [RFC 1/1] overview-manual: initial documentation for hash equivalence
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 JPEWhacker@gmail.com, docs@lists.yoctoproject.org
References: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
 <20210617195530.258307-2-michael.opdenacker@bootlin.com>
 <c387f7056fa5a182f564f9bf43f91111aae0dcb3.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9fe6ba2f-259d-3c87-5ff8-d3a3566c102e@bootlin.com>
Date: Fri, 18 Jun 2021 18:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c387f7056fa5a182f564f9bf43f91111aae0dcb3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

Many thanks for your review and for your guidance.

On 6/17/21 10:40 PM, Richard Purdie wrote:
> Hi Michael,
>
> Thanks for starting this. I don't think the explanation is as clear as it 
> needs to be. I've added some suggestions below on how to improve that. I'd 
> also comment that when describing this, you need to be specific about which 
> hash you refer to in all case. The task's hash for sstate purposes or the 
> hash of it's output for example. There are too many hashes!
>
> On Thu, 2021-06-17 at 21:55 +0200, Michael Opdenacker wrote:
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/overview-manual/concepts.rst | 63 ++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>
>> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
>> index ab882ff778..bb8318ea46 100644
>> --- a/documentation/overview-manual/concepts.rst
>> +++ b/documentation/overview-manual/concepts.rst
>> @@ -1950,6 +1950,69 @@ another reason why a task-based approach is preferred over a
>>  recipe-based approach, which would have to install the output from every
>>  task.
>>  
>>
>> +Hash Equivalence
>> +----------------
>> +
>> +The above section explained how BitBake skips the execution of tasks
>> +which output can already be found in the Shared State Cache.
> I think here it may make sense to next define "equivalence", something like:
>
> During a build, it may often be the case that the output/result of a task might 
> be unchanged despite changes in the task's input values. An example might be 
> whitespace changes some input C code. In project terms, this is what we define 
> as "equivalence". We can create a hash/checksum which represents a task and two 
> input task hashes are said to be equivalent if the hash of the generated output 
> (as stored/restored by sstate) is the same.
>
> You can then go on to say that this means:
>
>> +BitBake can go beyond this and also skip the execution of tasks that,
>> +even though the hash for their dependencies has changed, still generate
>> +identical output.
>> +
>> +So, even if two executions of a given task can have a different hash,
>> +because of potentially different sources, different environment variables
>> +or different output hashes for the tasks they depend on, they can be considered
>> +as "equivalent" as long as they generate the same output hash.
> Once bitbake knows that two input hashes for a task have equivalent output, 
> this has important and useful implications for all tasks depending on this task.
>
>
>> +Thanks to this equivalence, a change in one of the tasks in BitBake's run queue
>> +doesn't have to propagate to all the downstream tasks that depend on the output
>> +of this task, causing a full rebuild of such tasks, and so on with the next
>> +depending tasks. Instead, BitBake can safely retrieve all the downstream
>> +task output from the Shared State Cache.
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
>> +   library dependency, but thanks to their output being identical, hash
>> +   equivalence will stop the propagation down the dependency chain.
>> +
>> +-  Native tool updates. Though the depending tasks should be rebuilt,
>> +   it's likely that they will generate the same output and be marked
>> +   as equivalent.
>> +
>> +This mechanism is enabled by default in Poky, and is controlled by two
>> +variables:
>> +
>> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote hash
>> +   equivalence server to use.
>> +
>> +-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
>> +
>> +Therefore, the default configuration in Poky corresponds to the
>> +below settings::
>> +
>> +   BB_HASHSERVE = "auto"
>> +   BB_SIGNATURE_HANDLER = "OEEquivHash"
>> +
>> +Another possibility is to share a hash equivalence server on a network,
>> +by setting::
>> +
>> +   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
>> +
>> +.. note::
>> +
>> +   The hash equivalence server needs to be maintained together with the
>> +   share state cache. Otherwise, the server could report shared state hashes
>> +   that do not exist.
> We therefore recommend that one hash equivalence server be setup to correspond 
> with a given sstate cache.


Thanks, I took these suggestions in my branch, removing some of the
replaced lines.

I will also take care of properly explaining the different hashes.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


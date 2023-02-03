Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F364C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 09:42:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6986.1675417348798281513
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 01:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g9kqZ1fX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A12D224000C;
	Fri,  3 Feb 2023 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675417346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kSPTRFSHDaKQBOpwNB+x3d1z1rSjLho2n5Jdkm/aMf8=;
	b=g9kqZ1fX72P4mHrmwNLqypDClUbPwgUlBmso8k63bPMIWvmm8xlWZrM6oAtjrgzyniR+3d
	neENgCfn+jkbP2W2DRXa5hV8ktozRzx7/asm2Ps5NXLVELOFeGNewenVquQGODe+wwbNP3
	LnW7/PC5+0WCFnn0VEtQBHO157o7EM7DlAsw1GTrU6rNfuQ2XrVTEz8R8bb6Dtd1UeWzyp
	WUcMYUs7mczwhjTUsd50Q2uHI5a6UfnbAQ1QI2PpjLUOtDEnacWfWmccGP4RQN1qCBIWxs
	tvglmLdhQA2agNnlwR4kDYnhf4TR6srO3FAsB5SqvKQLjfxtKnxvaKXab04m6g==
Message-ID: <3ce2f565-05ca-2410-5368-d1990a66b6bb@bootlin.com>
Date: Fri, 3 Feb 2023 10:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
 <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com>
 <c7172449-e2c5-012f-e8fd-05b4edaf7eb9@bootlin.com>
Content-Language: en-US
Organization: Bootlin
In-Reply-To: <c7172449-e2c5-012f-e8fd-05b4edaf7eb9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Feb 2023 09:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3632

Hi again Alex (Kiernan),

On 02.02.23 at 19:06, Michael Opdenacker wrote:
> Hi Alex,
>
> I tried the example you gave to use the "cargo-update-recipe-crates" 
> class.
>
> On 15.01.23 at 21:03, Alex Kiernan wrote:
>> We should reference `cargo-update-recipe-crates` here rather than
>> `cargo bitbake`. The flow for creating a recipe then goes something
>> like (using hippotat as an example
>> https://www.chiark.greenend.org.uk/~ianmdlvl/hippotat/current/docs/):
>>
>> devtool add -S a6ac94b4922602af64f22b86ba5347ad95fcda44 -V 1.1.7
>> hippotat https://salsa.debian.org/iwj/hippotat.git
>> # edit resulting recipe delete boiler plate tasks and add `inherit
>> cargo cargo-update-recipe-crates`
>> bitbake -c update_crates hippotat
>> # edit recipe to add `require ${BPN}-crates.inc`
>> devtool build hippotat
>> # fix resulting errors (add `DEPENDS += "openssl"`, `inherit
>> pkgconfig` in this case)
>> devtool build hippotat
>
>
> I did just that, but "devtool build hippotat" failed:
>
> <<<
>
> NOTE: hippotat: compiling from external source tree 
> /home/mike/work/yocto/poky/build/workspace/sources/hippotat
> ERROR: hippotat-1.1.7+git999-r0 do_compile: oe_runmake failed
> ERROR: hippotat-1.1.7+git999-r0 do_compile: 
> ExecutionError('/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux/hippotat/1.1.7+git999-r0/temp/run.do_compile.14532', 
> 1, None, None)
> ERROR: Logfile of failure stored in: 
> /home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux/hippotat/1.1.7+git999-r0/temp/log.do_compile.14532
> Log data follows:
> | DEBUG: Executing python function externalsrc_compile_prefunc
> | NOTE: hippotat: compiling from external source tree 
> /home/mike/work/yocto/poky/build/workspace/sources/hippotat
> | DEBUG: Python function externalsrc_compile_prefunc finished
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 20
> | cargo build --release  --workspace
> | rm -rf docs/html
> | sphinx-build -M html docs docs
> | /bin/bash: line 1: sphinx-build: command not found
> | make: *** [Makefile:68: docs/html/index.html] Error 127
> | make: *** Waiting for unfinished jobs....
> |     Updating crates.io index
> | warning: spurious network error (2 tries remaining): failed to 
> resolve address for github.com: Name or service not known; class=Net (12)
> | warning: spurious network error (1 tries remaining): failed to 
> resolve address for github.com: Name or service not known; class=Net (12)
> | error: Unable to update registry `crates-io`
> |
> | Caused by:
> |   failed to fetch `https://github.com/rust-lang/crates.io-index`
> |
> | Caused by:
> |   network failure seems to have happened
> |   if a proxy or similar is necessary `net.git-fetch-with-cli` may 
> help here
> | 
> https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
> |
> | Caused by:
> |   failed to resolve address for github.com: Name or service not 
> known; class=Net (12)
> | make: *** [Makefile:52: stamp/cargo-build] Error 101
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> ERROR: Task 
> (/home/mike/work/yocto/poky/build/workspace/recipes/hippotat/hippotat_git.bb:do_compile) 
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 739 tasks of which 731 didn't need to 
> be rerun and 1 failed.
>
> Summary: 1 task failed:
> /home/mike/work/yocto/poky/build/workspace/recipes/hippotat/hippotat_git.bb:do_compile 
>
> Summary: There was 1 WARNING message.
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
> >>>
>
> I did try to add BB_NO_NETWORK = "0" to conf/local.conf but it didn't 
> help.
> Any clues?
>
> Maybe we could use an example that's simpler to build and with fewer 
> dependencies...
> Cheers
> Michael.


I tried with uutils too (we have it in meta-oe), and I also get 
networking errors. It seems that Cargo is trying to connect to the 
network at build time.

Trying "cargo bitbake" on uutils was so much easier (just checkout the 
tag / commit you want in the git repository, run "cargo bitbake" and you 
get a recipe that builds just fine).

 From the example instructions you gave, devtool didn't even realize 
that the recipe was meant to be built with Cargo. How could it?

So, I'd rather document a workflow that's by far the easiest, even if 
that's not something officially supported by the Yocto Project.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.5415.1623230620305761263
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 02:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PZx5/5TG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id o127so3552701wmo.4
        for <docs@lists.yoctoproject.org>; Wed, 09 Jun 2021 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=dTWKwoAPJxZ8DfScqjM5QeXaEiCXsmsMJjDusVSOj4Q=;
        b=PZx5/5TGL0V0qyBMRzVQ1xvcLNDH0LX2rkEKxAuAveC5noAMHNY61G1TZdTDTyU7hf
         1di1QK4Ae8+4Zd0qGb7AeYVZgFdSE7PE+e9Ksf1URraBiSVDJ2C+eKWUusvpg+Mi9f3+
         1z3ZFp4jgUrBrSVvs+1dE1zdMUktZ6i3ZxsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dTWKwoAPJxZ8DfScqjM5QeXaEiCXsmsMJjDusVSOj4Q=;
        b=JrobjmpSvkPTNYJVkGoZ8iETfXUP0aZS2NcxOAxm9s4rB7PH5dFqxkCJfMM2m3+USH
         lST90dUGExcyUwEw10orsFW5wDf/Gg0nMTq0audtXIYwr3APvv7FriyXzw57cD8a+zLM
         zeeGnoIi2tb/tTaKsj7MDiklKclONizTcDii2X9WXaUSrl3m7xMiMrcDfNUL6YOKi6jr
         qKuq2/Qcg8rK9FhccoN6AqlzkhAq7yFaISYrf58qjgELOPtce9eWZzI+eInL3wHUHjT1
         dC0EMN+2GB2nEGvAS0rpIdk4xDPYxnwU5vewbDp0Fpt7kUdt9pee5Az2fTlu4KeJp3kv
         XP+Q==
X-Gm-Message-State: AOAM531VUwFbg/QDQoRtX8/+47N0rSKN42DwXTchRz0GYrL09tlb2uGE
	bisa2TgiBJG7xXNLqmtmXQKCTg==
X-Google-Smtp-Source: ABdhPJyF+9dPIJTmIH1AYhd0QAa8YFdmnWOd7CK/qqvZItOont78wfBYHkyAewP73ebwRC9MYYf9GA==
X-Received: by 2002:a05:600c:4285:: with SMTP id v5mr8722978wmc.184.1623230618381;
        Wed, 09 Jun 2021 02:23:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d6f8:4296:455a:d852? ([2001:8b0:aba:5f3c:d6f8:4296:455a:d852])
        by smtp.gmail.com with ESMTPSA id m21sm5400174wms.42.2021.06.09.02.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 02:23:38 -0700 (PDT)
Message-ID: <bd3a88e611ed0de758eafd6928e2ee077b4861d5.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] test-manual: add initial reproducible builds documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 09 Jun 2021 10:23:35 +0100
In-Reply-To: <20210609091143.vvykg2irov6wcbdu@qschulz>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
	 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
	 <20210609091143.vvykg2irov6wcbdu@qschulz>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-09 at 11:11 +0200, Quentin Schulz wrote:
> Hi Michael, Richard,
> 
> On Tue, Jun 08, 2021 at 11:58:53AM +0200, Michael Opdenacker wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > +The Yocto Project defines reproducibility as where a given input build configuration will give the same binary output regardless of when it is built (now or in 5 years time), regardless of the path on the filesystem the build is run in, and regardless of the distro and tools on the underlying host system the build is running on.
> > +
> > +==============
> > +Why it matters
> > +==============
> > +
> > +The project aligns with the `Reproducible Builds project <https://reproducible-builds.org/>`_, which shares information about why reproducibility matters. The primary focus of the project is the ability to detect security issues being introduced. However, from a Yocto Project perspective, it is also hugely important that our builds are deterministic. When you build a given input set of metadata, we expect you to get consistent output. This has always been a key focus but is now true down to the binary level including timestamps.
> > +
> 
> "now" is too abstract? Can we say at least since when (e.g. which release)?

As of dunfell we enabled reprodubile builds in poky by default.

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta-poky/conf/distro/poky.conf?id=25a17f0346ab05b3212bb280e4a8b622bcf99bce

> 
> > +For example, at some point in the future life of a product, you find that you need to rebuild to add a security fix. If this happens, only the components that have been modified should change at the binary level. This would lead to much easier and clearer bounds on where validation is needed.
> > +
> > +This also gives an additional benefit to the project builds themselves, our hash equivalence for :ref:`Shared State <overview-manual/concepts:Shared State>` object reuse works much more effectively when the binary output remains the same.
> > +
> > +===================
> > +How we implement it
> > +===================
> > +
> > +There are many different aspects to build reproducibility, but some particular things we do within the build system to ensure reproducibility include:
> > +
> > +* Adding mappings to the compiler options to ensure debug filepaths are mapped to consistent target compatible paths. This is done through the ``DEBUG_PREFIX_MAP`` variable which sets the ``-fmacro-prefix-map`` and ``-fdebug-prefix-map`` compiler options correctly to map to target paths.
> 
> Would documenting DEBUG_PREFIX_MAP make sense? Is it supposed to be
> changed by users in some cases?
> for reference, where it's being defined: https://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/bitbake.conf#n612

Users shouldn't need to mess with it but it should be documented.

> 
> > +* Being explicit about recipe dependencies and their configuration (no floating configure options or host dependencies creeping in). In particular this means making sure :term:`PACKAGECONFIG` coverage covers configure options which may otherwise try and auto-detect host dependencies.
> > +* Using recipe specific sysroots to isolate recipes so they only see their dependencies. These are visible as ``recipe-sysroot`` and ``recipe-sysroot-native`` directories within the :term:`WORKDIR` of a given recipe and are populated only with the dependencies a recipe has.
> 
> Can't we just reference RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE here?
> Aaaand I just discovered these aren't in the variable glossary but I
> find them very important?

I suspect unfortunately our recipe specific sysroots are basically not 
documented at all :(. Again, probably needs fixing ultimately.

> 
> Can be done later on since they do not exist yet.
> 
> > +* Build images from a reduced package set: only packages from recipes the image depends upon.
> > +* Filtering the tools available from the host's PATH to only a specific set of tools, set using the :term:`HOSTTOOLS` variable.
> > +
> 
> ``PATH``?
> 
> Also, I think we use dashes more than asterisks for lists?
> 
> I think there's also an additional point: we check the sources we
> download. Therefore, if a commit disappears (force-pushed/removed
> branch/tag), the tarball disappears from upstream, or its checksum
> differs from what we expect, we don't build.
> 
> Might be worth mentioning that we only download sources from the
> internet when we're missing them locally. So hosting a mirror for
> sources or making sure they are available locally is a need if you want
> to guarantee full reproducible builds.
> 
> And this is especially important to mention since some projects are
> removing their master branches for example in favor of main, breaking
> older builds. Or some projects change hosting services and do not
> redirect, or just disappear from the Internet.

Yes, we should put something in about input validation - all inputs
to the build have some kind of validation, by checksum or source 
control hash/revision.

> 
> > +=========================================
> > +Can we prove the project is reproducible?
> > +=========================================
> > +
> > +Yes, we can prove it and we now regularly test this on the Autobuilder. At the time of writing (Hardknott 3.3), OE-Core is 100% reproducible for all its recipes (i.e. world builds) apart from the Go language and Ruby documentation packages. Unfortunately, the current implementation of the Go language has fundamental reproducibility problems as it always depends upon the paths it is build in.
> > +
> 
> s/now//
> 
> Please give a link to reproducibility test archives/categories on the
> Autobuilder if there's any available?


Isn't that below with the current status? The autobuilder would be something like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible

but also

https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-centos
https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-debian
https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-fedora
https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-ubuntu

> 
> s/build/built/
> 
> I would add a reference to OE-Core term :term:`OpenEmbedded-Core (OE-Core)`
> which explains what exactly it is. It is an important reference since we
> really mean to say that openembedded-core layer recipes (which is
> meta layer in poky) is 100% reproducible, nothing else. Basically,
> OE-Core + Bitbake is guaranteed to be reproducible, but the moment you
> add another layer, no guarantee (e.g. because of additional
> configuration files, bbappends, overridden classes, etc...)
> 
> > +To run our automated selftest, as we use in our CI on the Autobuilder, you can run::
> > +
> > +   oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
> > +
> > +This defaults to including a world build so, if other layers are added, it would also run the tests for recipes in the additional layers. The first build will be run using Shared State if available, the second build explicitly disables Shared State and builds on the specific host the build is running on. This means we can test reproducibility builds between different host distributions over time on the Autobuilder.
> > +
> 
> s/Shared State/:ref:`Shared State <overview-manual/concepts:Shared State>`/
> 
> since we already reference it earlier in this page.
> 
> > +If ``OEQA_DEBUGGING_SAVED_OUTPUT`` is set, any differing packages will be saved here. The test is also able to run the ``diffoscope`` command on the output to generate HTML files showing the differences between the packages, to aid debugging. On the Autobuilder, these appear under https://autobuilder.yocto.io/pub/repro-fail/ in the form ``oe-reproducible + <date> + <random ID>``, e.g. ``oe-reproducible-20200202-1lm8o1th``.
> > +
> 
> Would it make sense to document OEQA_DEBUGGING_SAVED_OUTPUT too?
> 
> > +The project's current reproducibility status can be seen at https://www.yoctoproject.org/reproducible-build-results/
> > +
> > +===============================
> > +Can I test my layer or recipes?
> > +===============================
> > +
> > +Yes, see the self test in :ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>` at `meta/lib/oeqa/selftest/cases/reproducible.py <https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`_ which can be subclassed for specific use cases.
> 
> Please provide actual commands to run so the user does not have to guess :)

It is stated in the section above!

(oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds)

Cheers,

Richard


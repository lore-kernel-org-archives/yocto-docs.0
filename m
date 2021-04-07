Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web11.9763.1617811983533997868
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 09:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FFqDc6f6fz5tlH;
	Wed,  7 Apr 2021 18:12:48 +0200 (CEST)
Date: Wed, 7 Apr 2021 18:12:47 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Subject: Re: [docs] broken links
Message-ID: <20210407161247.p6jk2ow52scerzqa@qschulz>
References: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
 <20210107165951.aqx4maful2uhopzx@qschulz>
 <CAP71WjyK679c8hjEE53PVyi-_8vX5TS6umsXk+y2TGio8c30hQ@mail.gmail.com>
 <CAP71WjxBRT6tbpgDroR0bKq2B0Nvr6pxuMe2nG+5MmGwyVo4VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxBRT6tbpgDroR0bKq2B0Nvr6pxuMe2nG+5MmGwyVo4VQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2021 at 07:26:17PM +0100, Nicolas Dechesne wrote:
> On Thu, Jan 7, 2021 at 6:08 PM Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
> 
> >
> >
> > On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz <
> > quentin.schulz@streamunlimited.com> wrote:
> >
> >> Hi Nicolas,
> >>
> >> On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:
> >> > hey!
> >> >
> >> > Robert opened a bug for a broken link in the doc, see
> >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168
> >> >
> >> > This is a valid bug, a regression in
> >> > e1bcfe4d8 dev-manual: remove unused labels
> >> >
> >> > Unfortunately, it opens a can of worms... since it looks like the built
> >> in
> >> > linkcheck did not detect the broken links, and this is not the only
> >> broken
> >> > link.
> >> >
> >> > I ran an online link checker on
> >> > https://docs.yoctoproject.org/dev-manual/common-tasks.html, and it
> >> reported
> >> > the following errors with anchors.. they look like they are regression
> >> with
> >> > the commit above..
> >> >
> >>
> >> [...]
> >>
> >> It'd be nice to fix the linkcheck indeed.
> >>
> >
> > hmm. could it be that linkcheck only checks for 'external' links?
> >
> 
> in the meantime I was looking for a tool I could run locally, and found [1]
> 
> It looks like it gives some good output:
> 
> $ pytest --check-links --check-anchors --check-links-cache
> _build/html/dev-manual/
> 
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#new-recipe-autotooled-package>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#new-recipe-single-c-file-package-hello-world>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#new-recipe-patching-code>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#new-recipe-fetching-code>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#new-recipe-post-installation-scripts>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#new-recipe-storing-and-naming-the-recipe>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#usingpoky-extend-customimage>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#finding-the-temporary-source-code>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#understand-what-gives-your-image-size>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#combining-multiple-versions-library-files-into-one-image>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#using-a-provided-kickstart-file>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#wic-using-the-wic-plugin-interface>
> FAILED _build/html/dev-manual/common-tasks.html <a href=#wic-requirements>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#best-practices-to-follow-when-creating-layers>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#using-bbappend-files>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#incrementing-a-binary-package-version>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#automatically-incrementing-a-binary-package-revision-number>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#qemu-image-running-tests>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-debugging-viewing-logs-from-failed-tasks>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-debugging-viewing-variable-values>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-viewing-dependencies-between-recipes-and-tasks>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-viewing-task-variable-dependencies>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-debugging-taskrunning>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-debugging-bitbake>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-debugging-buildfile>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#platdev-gdb-remotedebug>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-other-debugging-others>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#dev-viewing-task-variable-dependencies>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#platdev-appdev-devshell>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#using-a-quilt-workflow>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#how-to-submit-a-change>
> FAILED _build/html/dev-manual/common-tasks.html <a
> href=#figuring-out-the-mailing-list-to-use>
> FAILED _build/html/dev-manual/qemu.html <a
> href=#qemu-running-under-a-network-file-system-nfs-server>
> FAILED _build/html/dev-manual/qemu.html <a href=#kvm-cond>
> FAILED _build/html/dev-manual/start.html <a href=
> https://autobuilder.yocto.io//pub/nightly/>
> FAILED _build/html/dev-manual/start.html <a href=
> https://autobuilder.yocto.io//pub/nightly/>
> FAILED _build/html/dev-manual/start.html <a
> href=#checkout-out-by-tag-in-poky>
> 
> It's slow, it took 7 minutes to check for the dev-manual.. but it's a first
> step. now we need to fix them!
> 
> [1] https://github.com/jupyterlab/pytest-check-links
> 

In the end, I went for htmltest to test links:
https://github.com/wjdp/htmltest

~5min for the whole documentation. Not too bad :)

Cheers,
Quentin

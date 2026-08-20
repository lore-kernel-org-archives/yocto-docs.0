Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07CDC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:59:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23.1787237989010029595
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 07:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=J1lQ7Ym6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vfaJZMw9Ud1IucJ0MdFCGl6Z5rh3uUCuhRwN4aq71uo=; b=J1lQ7Ym630luHVs5P8hvnXNRIJ
	MSaDnlp5YBqwukCV3m0DgOVpL8BL7aDaHe6O8i0u+uBF5/4uDo81kyqUDhsAqNDsPaJt7tWjVDmga
	7MnaEMznSGB4Li3zSZA1Da3bY3RptG5cibcKnTKkDXNh1Cgx64hrhkUAthEazWU/l+OX3jFTOrkH4
	V4WqP0GZuST3UXNRqhw+EKOD5ut7FuSD5dpRKDIqwQFBd28mXQPal32UbT3IKgyEmSYYpNU59Q6W0
	JmEDcQfDDQX83j6zvOUdDE3c0674sv3iXxDprXNBxegSzuq/UH8xeWI//1BZsYH9Ffm888xfB/WZE
	ZSff+IDQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:46908 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wx4F8-0000000HTcP-0AdP;
	Thu, 20 Aug 2026 10:59:47 -0400
Date: Thu, 20 Aug 2026 10:58:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: tgamblin@baylibre.com, YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] commands to do "pip install" in docs README file need
 enhancing
In-Reply-To: <1b02e8ba-0946-40b0-a8e7-a381fd8cb81e@cherry.de>
Message-ID: <49274709-3cac-6623-0c3e-7e4b1656e034@crashcourse.ca>
References: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca> <DKTSXW5WZTQW.383TF2WMPIE77@baylibre.com> <1b02e8ba-0946-40b0-a8e7-a381fd8cb81e@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-202059268-1787237909=:3293921"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10304

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-202059268-1787237909=:3293921
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Aug 2026, Quentin Schulz wrote:

> On 8/20/26 3:23 PM, Trevor Gamblin via lists.yoctoproject.org wrote:
> > On Thu Aug 20, 2026 at 7:20 AM EDT, Robert P. J. Day wrote:
> > >
> > >    I just went through this with another Sphinx-based documentation
> > > repo -- installation instructions that advise the reader to install
> > > Python modules with "pip install" fail on my Debian 13 system with:
> > >
> > >
> > > $ pip install sphinx-lint
> > > error: externally-managed-environment
> > >
> > > × This environment is externally managed
> > > ╰─> To install Python packages system-wide, try apt install
> > >      python3-xyz, where xyz is the package you are trying to
> > >      install.
> > >
> > >      If you wish to install a non-Debian-packaged Python package,
> > >      create a virtual environment using python3 -m venv path/to/venv.
> > >      Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
> > >      sure you have python3-full installed.
> > >
> > >      If you wish to install a non-Debian packaged Python application,
> > >      it may be easiest to use pipx install xyz, which will manage a
> > >      virtual environment for you. Make sure you have pipx installed.
> > >
> > >      See /usr/share/doc/python3.13/README.venv for more information.
> > >
> > > note: If you believe this is a mistake, please contact your Python
> > > installation or OS distribution provider. You can override this, at
> > > the risk of breaking your Python installation or OS, by passing
> > > --break-system-packages.
> > > hint: See PEP 668 for the detailed specification.
> > >
> > >
> > >    Yes, there are solutions, such as using "pipx" instead of "pip", and
> > > what have you, but it seems that the README file should be augmented
> > > with an explanation as to how to deal with the above given that the
> > > "pip install" commands are, in some cases, guaranteed to fail.
> >
> > Creating a venv like the error suggests (or via uv) is simple enough and IMO
> > best practice for anything like this. You could submit a change to provide
> > short
> > examples, even replacing the references to pipenv earlier in the file.
>
> It's not that simple (though not that difficult). A venv by default
> is completely isolated and doesn't use anything from the host. The
> issue is that by doing so, you won't be able to build the docs, only
> run sphinx-lint, which isn't ideal. You should probably reuse the
> same venv as documented in
> documentation/tools/host_packages_scripts/pip3_docs.sh instead.
>
> You probably want to update the instructions for Vale as well. We
> still support pipenv though, via documentation/Pipfile as far as I
> remember, so that's another option. Maybe add something in
> dev-packages for example. No clue, I don't use pipenv.

  i just *knew* i would regret asking that question but since this
absolutely *needs* to be resolved so that the instructions in the
README work, here's one solution.

  forget about venvs (at least for now). the only two packages that
need installation to run the executable commands sphinx-lint and vale
are the packages with the same names, and they are special cases since
their purpose is to supply those commands, so the simple solution is
to install using "pipx", which is designed precisely for that purpose.

  one can install pipx with pip, then follow that with:

  $ pipx install sphinx-lint
  $ pipx install vale

and it all now works just fine on debian 13. maybe down the road get
fancier with "uv" or whatever but the above will just work, no?

rday


--8323329-202059268-1787237909=:3293921--


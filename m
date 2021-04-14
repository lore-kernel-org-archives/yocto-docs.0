Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.9991.1618389417647397482
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:44964 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lWb15-00C0e0-PN; Wed, 14 Apr 2021 04:36:56 -0400
Date: Wed, 14 Apr 2021 04:36:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
    Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 08/13] ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
In-Reply-To: <CAP71WjxiU5pfmCkybgaqijUz1LbMoe5_3tJcQDuYWeSsm+hxgg@mail.gmail.com>
Message-ID: <1b5dc85a-24ab-379d-47ef-6d11229f71da@crashcourse.ca>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com> <c973665acd8a5259b19ab512b2ae7f6d10848cb5.1618358456.git.paul.eggleton@linux.microsoft.com> <20210414081303.kciysuaevt3bhjtg@qschulz>
 <CAP71WjxiU5pfmCkybgaqijUz1LbMoe5_3tJcQDuYWeSsm+hxgg@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-1113481319-1618389415=:6051"

--8323328-1113481319-1618389415=:6051
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 14 Apr 2021, Nicolas Dechesne wrote:

> On Wed, Apr 14, 2021 at 10:13 AM Quentin Schulz <quentin.schulz@streamunlimited.com>
> wrote:
>       Hi Paul,
>
>       On Tue, Apr 13, 2021 at 05:19:49PM -0700, Paul Eggleton wrote:
>       > From: Paul Eggleton <paul.eggleton@microsoft.com>
>       >
>       > Add a reference to the recently added passwd-expire command in
>       > EXTRA_USERS_PARAMS.
>       >
>       > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
>       > ---
>       >  documentation/ref-manual/variables.rst | 11 +++++++++++
>       >  1 file changed, 11 insertions(+)
>       >
>       > diff --git a/documentation/ref-manual/variables.rst
>       b/documentation/ref-manual/variables.rst
>       > index 2e3cc22..3b76dbc 100644
>       > --- a/documentation/ref-manual/variables.rst
>       > +++ b/documentation/ref-manual/variables.rst
>       > @@ -2293,6 +2293,17 @@ system and gives an overview of their function and
>       contents.
>       >           # usermod -s /bin/sh tester; \
>       >           # "
>       > 
>       > +      Additionally there is a special ``passwd-expire`` command that will
>       > +      cause the password for a user to be expired and thus force changing
>       it
>       > +      on first login, for example: ::
>       > +
>
>       IIRC, :: will behave the same as : ::, so please use the former (trying to
>       have consistency across all docs, though we're far from it now :|, but
>       this change is something we want).
>
>       Pinging @Nicolas just for confirmation :)
>
>
> Yes, agreed. There was a patch floating around to convert all
> instances of : :: into ::, not sure if it was merged or dropped..

  i recall sending such a patch a while back, but for whatever reason,
it did not apply cleanly so it was shelved.

rday

--8323328-1113481319-1618389415=:6051--

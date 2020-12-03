Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.6887.1606979165010626536
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Dec 2020 23:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TJq8ukCS;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id r127so1089825yba.10
        for <docs@lists.yoctoproject.org>; Wed, 02 Dec 2020 23:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8snm31FgQdWMJenaw+wtOo2Q9zKGi817acx4kztAOq0=;
        b=TJq8ukCSY7b6INPIa1wORsGu1EuIxeBn/o5IrqyvhZOfoEU1rXEz+Ng1y0wUr5ADtK
         9Tbj030ICcBpC/LG2hpuDwDSod+UXWuPdFgb4lWu9wIjrn6aRKYo3q/XhvWWxrGicHHY
         OBS9jEf3yBlqH2LDMuLqAvdI5ZpHu2LZ35i0joM+xvxeumJ9VZ5N39Elwx2NWpmdEz7Z
         MkoofsnEtTLG2wpJS8xlUt33IcGRuKqfniK8E3vxEcYIuiWXdgMyF7ySvKTKUrPZRnSx
         yZ7FshQhV5XlPZzZdJNO/dLypijGKguwHG74xc6a2uQ+Iwg1rDwe9Y5mMgPvyHeIOZBV
         goeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8snm31FgQdWMJenaw+wtOo2Q9zKGi817acx4kztAOq0=;
        b=Urq7bndxzMTr5ky0nPvGyLCxZFnpEx3SKUPEwhmwoeRtkZjTeIy6cX/Bn0opVSPwkz
         0a0lfb5mtaqZWYyg4IXAA+3OL+SdXvjiOpVVmkjTvAKBSolWtJ0qUQisXnzxlblWnMgk
         KKjHJhtigFGB8qK5Aqp6eC4N4RZYGBgeu/PKIcqhwJbg28nZpoWggfjt/8Kb/1FhcP0z
         CSg4tjKibzphwMa983aRIOXryls030atPzRnrDyuzVTxoHhMTEKg+JPI3RtbRQoxH3gF
         k7Uz/8EY6s9ylzNt7yRtqjtzEssGuT6Dq0GwXFFSY9lkbAfY52dQzbD6DWJNika9LFAu
         h1WA==
X-Gm-Message-State: AOAM532vA82hdBH3uHaDq0A0r+NEe8Nt8+/BiBwABBRk1jXpfv68FVfG
	QuJWvd9eHK8JHOoBbuuuJEXRmnZEsTEcc7F5YQ4dcQ==
X-Google-Smtp-Source: ABdhPJx50/Wz8i/3um3T6ft6Ki1lKlPPh/4Hvx5yfCkKbiIga3SniaT4+IYaMKt5pSHpn+qsonIP1NNtTuzsU8ERLfA=
X-Received: by 2002:a25:b804:: with SMTP id v4mr2860640ybj.371.1606979163877;
 Wed, 02 Dec 2020 23:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
 <CAP71WjxVVNuAtBvYJLwgMSSkx6FYsq3+06txyGpa2h=jFPWjdw@mail.gmail.com> <CADfgfoZWoi4N67eckSAp93=1DRKqWayjAJ2r-oVmdjD=H50r-w@mail.gmail.com>
In-Reply-To: <CADfgfoZWoi4N67eckSAp93=1DRKqWayjAJ2r-oVmdjD=H50r-w@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 3 Dec 2020 08:05:54 +0100
Message-ID: <CAP71WjwuWRaOmG6aCcwMy7ProjLFvXFyJ3DPR09HVg+C9QEnKg@mail.gmail.com>
Subject: Re: [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <rpurdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 12:20 AM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> I just updated the transition branch and re-ran the docs build. It looks good to me now.

Right. Looks good to me as well!
thanks!

>
> On Wed, Dec 2, 2020 at 2:38 PM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>
>> On Wed, Dec 2, 2020 at 11:07 PM Michael Halstead
>> <mhalstead@linuxfoundation.org> wrote:
>> >
>> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
>> > ---
>> >  documentation/poky.yaml                  | 2 +-
>> >  documentation/releases.rst               | 1 +
>> >  documentation/sphinx-static/switchers.js | 2 +-
>> >  3 files changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
>> > index 57da0a7c2..c1340c25e 100644
>> > --- a/documentation/poky.yaml
>> > +++ b/documentation/poky.yaml
>> > @@ -4,7 +4,7 @@ DISTRO_NAME : "Gatesgarth"
>> >  DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
>> >  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>> >  YOCTO_DOC_VERSION : "3.2"
>> > -YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
>> > +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.4"
>> >  DISTRO_REL_TAG : "yocto-3.2"
>> >  POKYVERSION : "24.0.0"
>> >  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>> > diff --git a/documentation/releases.rst b/documentation/releases.rst
>> > index 9992f97d5..85b31b64d 100644
>> > --- a/documentation/releases.rst
>> > +++ b/documentation/releases.rst
>> > @@ -12,6 +12,7 @@
>> >  - :yocto_docs:`3.1.1 Documentation </3.1.1>`
>> >  - :yocto_docs:`3.1.2 Documentation </3.1.2>`
>> >  - :yocto_docs:`3.1.3 Documentation </3.1.3>`
>> > +- :yocto_docs:`3.1.4 Documentation </3.1.4>`
>>
>> The patch looks good, however, but http://docs.yoctoproject.org/3.1.4
>> currently does not exist. When are you planning to deploy the docs for
>> 3.1.4?
>>
>> >
>> >  ==========================
>> >   Previous Release Manuals
>> > diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
>> > index fe9841b10..fc901d329 100644
>> > --- a/documentation/sphinx-static/switchers.js
>> > +++ b/documentation/sphinx-static/switchers.js
>> > @@ -4,7 +4,7 @@
>> >    var all_versions = {
>> >      'dev': 'dev (3.3)',
>> >      '3.2': '3.2',
>> > -    '3.1.3': '3.1.3',
>> > +    '3.1.4': '3.1.4',
>> >      '3.0.4': '3.0.4',
>> >      '2.7.4': '2.7.4',
>> >    };
>> > --
>> > 2.28.0
>> >
>
>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer

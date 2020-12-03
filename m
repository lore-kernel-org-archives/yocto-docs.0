Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.4688.1607032799244926182
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=opU9wS1G;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id o71so3503342ybc.2
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrjRGeg7eqQE4J4T0ExHfcPNgi1eTLI1QmRIeoa9QYM=;
        b=opU9wS1GtG880aO3CsKVp+gu9/QxIfp6CR8WUBEJsnQs/I8bH+IjZVD5ONAaz2l/ho
         CTMSl0naMDVxqMnzBBX2uySKCf5Y5RkOApncRh8HWz+skLiikUIiFGdpz7errMWqwnfB
         HMr8vY2gUkUQ53dJ6gONPvPJEg1Jo3/AMs87cd2MFMSIkitwgycn9NiAxL7ZQs3Nxfww
         UpwCWjOAR+0b3tEhfw+WleLJCLL8btBjLalo+PB6l8Ayw/cJHHcBD/H7t4Cj/I1e6INN
         D6I5CMkufOobL+YzPm6PePmWnqm4mGfwHEXH3qiJZoHqIoz6d/6+uOdK9g6WV9ryx2Xm
         SfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrjRGeg7eqQE4J4T0ExHfcPNgi1eTLI1QmRIeoa9QYM=;
        b=YhvIk3fzpsVaE3KGj9wZmvQjvRiFTbKhcp209c6qAbCXQ5HLslThUIUH5BiPjgMAnf
         WN5vScKDanQm+g03SnzWGRt9AxY5kZBTeUeDgm/axSVonXPEAXmbXoUbS0SHl/XC+uFs
         25z3XoTB9GW9Q/LbK/r+WFl62XLg1c1DfkxLGAr2FfX1V1RjwZ16H68qs8Z8jQT/htST
         m1C4uxP5yzH+K2wyhpxTAqvYcB7/Ub70D175Ifp7kaCsjEjr+27t58IvteHRcu545UYJ
         /u8KV8toRIoTogwUqhZ5omnJA7BqNlNPYbvI9MoXzndtYiRS8Dv0yICBU57nOOSlIUr0
         OhTA==
X-Gm-Message-State: AOAM532XVU43bFLUzACswbjIYFMC7Lw216cT3QI1gfQPSoSQ6SbNwLVg
	+nb2k3I5qEEBnx//5kd6EwKNQtMuwhUNSkrIi7U6uA==
X-Google-Smtp-Source: ABdhPJz7q6nps0gfhpCww00USfPl96ju3IDN2qslcwJhkEfdKwxIRpb7obveGT6lNZocwsV5W4S71MU/P/OuC7HYo7k=
X-Received: by 2002:a25:ab2c:: with SMTP id u41mr1761603ybi.133.1607032798352;
 Thu, 03 Dec 2020 13:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
 <a9242731-e044-c649-ac05-4b18ee33f011@gmail.com> <d0b92a768d8e231407eb9bd78c0c43baa161f8d8.camel@linuxfoundation.org>
In-Reply-To: <d0b92a768d8e231407eb9bd78c0c43baa161f8d8.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 3 Dec 2020 22:59:47 +0100
Message-ID: <CAP71Wjzr7aysstZXD5SbzG0vTsjccoWdFj4HcnRQ6X-q+4O-xA@mail.gmail.com>
Subject: Re: [docs] [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: akuster808 <akuster808@gmail.com>, Michael Halstead <mhalstead@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, Richard Purdie <rpurdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 10:43 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-12-03 at 13:40 -0800, akuster808 wrote:
> > IMHO, I believe the branch maintainer should take up this task.
> >
> > Should update process page if not already noted.
>
> I'm a little torn on this since the final step is part of the
> "publication" of the release and the CI system does live deployment...

hmm. I think my previous email was a reply to another discussion..
sorry about that. sorry about this..

Hopefully this was the last release with Docbook, so we won't need to
'touch' the transition branch again. That branch hosts a 'wrapper' in
sphinx for each release done with docbook, so that we have all docs in
one place. It should have been made along with the release, i agree..
Next 3.1 release will be based on Sphinx. I don't think we have clear
instructions to make a docs release with Sphinx though, but that we
need to properly document for sure!

>
> Cheers,
>
> Richard
>

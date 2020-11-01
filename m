Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.18033.1604251186153128191
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 09:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nCv93wUP;
 spf=pass (domain: linaro.org, ip: 209.85.219.173, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f173.google.com with SMTP id i186so9675696ybc.11
        for <docs@lists.yoctoproject.org>; Sun, 01 Nov 2020 09:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=awsMuqjYkGTwhNWbDBh8tBjY/6KcSS79WB9wAbbUWzg=;
        b=nCv93wUPRRS/XMvHtI8BhffGzAJMuhQQaLkrMR/rH0b1RUYhTyxnKdrWaQMwDU5s5f
         MnUsfh49ZtILHd12gnVFyp30HFZjyW5Kr+B9QoW+gs+tYL5l3pi+It/fARjBbx5CL2xu
         0F5eavDh0KWW1tCV8xzHkyE7ZJN3hK2r2B83i5NHeCCv+epJtSpKy6rVOf2gD2mB22mW
         Wt1jl6I4yzHiWNNR205qsox/Ip7uuilRrQ1E1/8Kd78iuE1PcbwWqJ+FP/8blQw09R+8
         p1UJm6FBt3TABJh60h+y3wy1tQ7TOETiFquLrc6UPM7jvZLrp5yXxZoVScCAjXtPRxzC
         213w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=awsMuqjYkGTwhNWbDBh8tBjY/6KcSS79WB9wAbbUWzg=;
        b=KQv0Bqx1U3w8UaVJvyjexSuTHvQWphLbb8pSo917K0Duh6D8MBLR+L2xtG3fzmiBAw
         B4cRL1Dc8s95SdjANTyx2vOtU0pbd0Q1b6qwVn1YR28KLo/CsPOv4GXKXTFHRWlI8WCT
         zngYE7LWFA/VI8eR+fDexyWg8/9bKZq/HwCTPQDDF7FxMH0u4JevsWELaSRqOpV5+3z9
         g34Yl3I3Z5UwTFNWb5aLdQbG7dZU63nUAWUJG4LvfET2QUWTEi12FWPRFDNilyD0D7ar
         YtNAy8EzAS0iJXfRx0kRGLeUbxvpxPFqkqZjQAzK4+Ig8Af90sDPtKjrmGMK3bwjtsMj
         nFMw==
X-Gm-Message-State: AOAM531w+wxqqbDFjqFdmxUKgBxmgGIop/CPFKehGbzgQ//an+d513JF
	jepsbDShcyITW2zRvaoORovsQRhHzO3EqhoEhlqV9A==
X-Google-Smtp-Source: ABdhPJwZ4R5IPBx0yIDS7WoDCunn+7ZZFuk6WiMvWDANW8SxJm9mWIg8SwTjtoOsbejOUXQau4sJvpg//MvVhSed3CI=
X-Received: by 2002:a25:80cd:: with SMTP id c13mr18024451ybm.371.1604251185225;
 Sun, 01 Nov 2020 09:19:45 -0800 (PST)
MIME-Version: 1.0
References: <19b4d4c8-7bfe-4096-8ed-d82e61487bc2@crashcourse.ca>
In-Reply-To: <19b4d4c8-7bfe-4096-8ed-d82e61487bc2@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Sun, 1 Nov 2020 18:19:33 +0100
Message-ID: <CAP71WjxF2ns_tL86yCB8pXyZS_YpxR7g5sPTDGK4Ai8RTf0dag@mail.gmail.com>
Subject: Re: [docs] adding some semantic markup back into .rst files
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 1, 2020 at 12:05 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   one of the things that i liked about docbook was the semantic markup
> that could be customized for individual tags, such that a <filename>
> could be rendered differently from a <command> using XSLT stylesheets
> and so on. at the moment, things like that are all lumped together in
> the .rst files by marking them up with ``blah`` double backquotes,
> losing all that distinction. it wouldn't be hard to put back just a
> *little* of those semantics by using the more obvious roles.

I like the idea.. however there is one issue/limitation.. the roles
cannot be used in the context of directives, so we wouldn't be able to
use them in a 'literal block' for example, and I think that's an
important limitation. Can you check that? Perhaps I missed something.
I agree that removing the "replaceable" semantic was a bad thing.. but
that's one 'role' which is used primarily in code blocks..

>
>   there are two roles for marking up commands:
>
>   :command:
>   :program:
>
> the distinction appears to be that a :command: is meant to represent
> an OS-level command to be typed literally, such as "ls" or "rm". OTOH,
> a :program: should represent an executable program whose name could
> differ based on the OS, so that you would type:
>
>   :program:`sphinx-build`
>
> even if the actual name of the program on Windows was
> "sphinx-build.exe"; that is what i would think you would use to mark
> up, say, :program:`devtool upgrade`. currently, there doesn't appear
> to be any difference in the rendering, but it at least leaves open the
> possibility for the future, and in terms of possibly
> cross-referencing commands.
>
>   a third role i think would be useful is :dfn: which is used to mark
> the "defining instance" of a term -- it appears to be equivalent to
> docbook's "firstterm" tag. this does *not* automatically generate an
> index entry, but i suspect it could be used for exactly that if one
> wanted.
>
>   finally, there is :file: for filenames, which currently is being
> rendered the same as marking up with ``, but has the additional cool
> feature that, if you use {...} in a filename, what is inside the {} is
> rendered as docbook's equivalent of "replaceable", to show that it is
> meant to be filled in (currently rendered as bold italic). as an
> example of that, in the dev-manual (common tasks section), section
> 3.5.2, there is the expression:
>
>   ``${BUILDDIR}/conf/bblayers.conf``
>
> using :file: would most likely look like:
>
>   :file:`{BUILDDIR}/conf/layers.conf`
>
> that's getting fancy, but it is a neat feature.
>
>   in any event, i think taking advantage of at least the more obvious
> roles would be useful for down the road. thoughts?

yes, I think it would.. but what do you think about my previous observation ?

>
> rday
>
> 
>

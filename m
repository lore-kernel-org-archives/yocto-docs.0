Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web12.16010.1604073798642858574
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 09:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HhU5TDk0;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id m188so5539761ybf.2
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZvmVQJYwAhXdJm8uuUwVkhk2H5hivD17xFzRKOdzcec=;
        b=HhU5TDk0qygZs7pWYgtkXy1lCLZI6DR4Zwx1z/7hoGV9ybcUMFrJWcPcLCjddfgq+X
         kl733rPINz6mAGnYKfEkiCaA0hJ21fspYAXPd+wxxBi7TU4ZxFbK8Y47WN/B+FlybPgI
         ZqoUfNfQJRXMmlMAGnAgTYbLqQZVPnMcf3XqraaGLG011jaVCRpxllRt/ugju2v3lf8a
         6qBhqvxw4QGhV87wf5EuCxEz+iOewgpKq5zM4a4Qdf2tpdfvuRpKMX8D/QMp7aCYoMJ5
         OCS+NcAf7jxafs6Y4ZzD0Mtm7KXkhzmzifSRcOx20IO1dtO0l0+ESf7lreA0SAlSvKOv
         0KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZvmVQJYwAhXdJm8uuUwVkhk2H5hivD17xFzRKOdzcec=;
        b=jL991/f5KlcxaWYpFGOXXbwAletPIHeEgWbTKr0mupqoTdHg18pwHaZX8cvEDK4VRn
         6XRNljeYlAvN31AweEok7AJtz+m1W9nd0qe53QIlLsOu0xA8wRe7301t5ki+7lO65pkp
         OliNf2hq4KH30qZWz4EUb7uTqj87DA3ZA5unKXq4TE1LLL1fZwi5VX6LcoCwrULD5LTa
         iHFfJVD0jaDW9USWhG8v2jLYD9YRD9garLa2Vr+Lv68vHRCuxrUQdg2f9AIc9u7cAX7x
         JJzc7xvIaOGRq2X4yYxLwqjpw1t2f9NaP2iVbxH6xoA1P6qCTk9ScS7iFWxJ16/fIpm2
         6Ueg==
X-Gm-Message-State: AOAM531AszvJJo4dMzDJjfOYaEbzpwUUf9dAW33lTj155tnA9sDzCkFU
	G9+Fj+7wIPCdxLNj5PS739sEgrPmYayUZMzxZCMXkRr/kFIaXw==
X-Google-Smtp-Source: ABdhPJz+XctxFBcIcDnmwYFWnyCNqkWtTQhoVPJranQzIjZyW1frKiNfV1oLxTYd7+b5rueBCGDQkewBNUTlR6MSUFM=
X-Received: by 2002:a25:8407:: with SMTP id u7mr4642576ybk.397.1604073797685;
 Fri, 30 Oct 2020 09:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca>
In-Reply-To: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 17:03:06 +0100
Message-ID: <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com>
Subject: Re: [docs] possible marker cleanup: ": ::$" -> "::"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 4:07 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   in the midst of messing with "::" markers, i just noticed that there
> is a *ton* of literal code block markers of the form:
>
>   ... blah blah: ::
>
>      code stuff
>
> this seems clearly overkill as the trailing "::" obviously starts a
> literal block, while the definition of the marker includes the
> explanation:
>
>   If it is preceded by whitespace, the marker is removed.
>
> in short, this appears to be *exactly* equivalent as if you had simply
> written:
>
>   ... blah blah::
>
>      code stuff
>
> the apparent effect in the original being to start a literal block
> while leaving the preceding colon there -- just what ending with "::"
> provides. does that seem about right? one suspects there is a pile of
> marker simplification could be done.

You are correct. all instances of ": ::" can be replaced with "::". If
you make the change, you will notice that the generated HTML is not
changing.
So it's a style question. I would prefer the short "::" form, let's
check with RP and Quentin first as they have been the main
contributors so far!

>
> rday
>
>
>
> 
>

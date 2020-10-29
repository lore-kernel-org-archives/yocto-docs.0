Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web09.3575.1604004366872295002
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 13:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lemmvZiT;
 spf=pass (domain: linaro.org, ip: 209.85.219.170, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f170.google.com with SMTP id a12so3274470ybg.9
        for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2020 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6i6P7wEu/z2WrfRYyexrlLWAcBg85rsGyeZnB6S4LnM=;
        b=lemmvZiTP+1lpthz3DH4W8XLRoboIdQYe8TEjDtxKo/ggfJaslWZ2JRHk5qtWmqxpb
         7NLj9mC4Z2tP2/L08eg+MKEqfSWbr6m4lCucpW8V2xecW3rz30+zpKesd/LbnFhx8rc6
         z9thnHtUGbaHDQkOObCY5sTzDySmNY/zAVs/iLAsKomGSTsMIglD2fzkQYLRAVoPQaQ9
         lJEm8Van8GzB9IbrPtASuRhl7TryazomuPLHyiIo8x700V3wOHqOSXJj7Y27ZTTkMKDW
         Dha1G/iZznrUvgRWYuTqFFxe5ohKCdowS2zaFwVwJTODlV81eN3uQ/KytR62/s4icWtd
         kDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6i6P7wEu/z2WrfRYyexrlLWAcBg85rsGyeZnB6S4LnM=;
        b=fLQS1t5BMc6j903iLYsyyKspv4QuKwf0CklMbhqkQTmrJHAH5Rwb8b1Fu4gbNs/Smd
         zQ46Zh2q/Pi/pml7xlNpxaS22nQPQ072z8BFOE+wcUr2qojC65oLy9ZfEdajXDYohtcb
         dBrH6TykqkMo7RCzdygUbqI55U5l+5b/Mos3oQKseWWnIiROJiDFFUkmuJmPjCW+YveG
         7YZAKplDIJ16P7A9lC5tPO6t0g1L1wnNv5tEIUPLOjfaQGtOmKLrUuOTT86PCuLGYbMk
         uNcbi300fUW+v/Iw+pj0W6mhzqqFAU9Xx5WIoP0lSHMsqH+9Jsy5Pw34FOlTZlKyJADe
         KZPw==
X-Gm-Message-State: AOAM532RXKdOsGSsqAvnrAsmjbAcXL3lskcg9Lk2Esu4dOVDlA3gS4yi
	J7i2rEzbHa0iOADpEsKleFa51Ixyx0oh77b8GHTj5h9e97rIukPG
X-Google-Smtp-Source: ABdhPJzACQf3zYv1MUA6C9bqN64p9DMLz0/0c1sQmCRMl5PTQE3ZaK5JrOXWwdFlr5AB0LNq8oYL9BkjzMBBZ6MCXlM=
X-Received: by 2002:a25:8407:: with SMTP id u7mr8786660ybk.397.1604004365879;
 Thu, 29 Oct 2020 13:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <415b35f9-a6-b311-3522-20e76cf6593c@crashcourse.ca>
In-Reply-To: <415b35f9-a6-b311-3522-20e76cf6593c@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 29 Oct 2020 21:45:55 +0100
Message-ID: <CAP71Wjxe2w+=vh4L3E5MV03DyLPzt9C+9y17T4U+1ezKY8YL0A@mail.gmail.com>
Subject: Re: [docs] is there a rationale for the numerous "^::$" lines:
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 8:58 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>

you are correct, they are equivalent. we've been rushing with these
changes, and it's lack of consistency

>   just noticed the myriad of .rst content of the form:
>
>   ... blah blah woof woof:
>   ::
>
>      code snippet
>
> if memory serves, that would be equivalent to the simpler:
>
>   ... blah blah woof woof::

I tend to prefer this form, and I tried to use this one for the files
I edited.. We should agree on which one to use, and fix
inconsistencies.

>
>       code snippet
>
> as a trailing "::", as long as it is not preceded by white space, has
> the same effect. not suggesting massive refactoring, just wondering if
> there is a subtle difference between the two.


>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>

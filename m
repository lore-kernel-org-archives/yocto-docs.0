Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.14313.1629052029999791905
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Aug 2021 11:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WIYEL1pN;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id f23so16761573qkk.13
        for <docs@lists.yoctoproject.org>; Sun, 15 Aug 2021 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FJWOjjSRPXGOfnYWNnwRSDQvrCXqpcbgMxn/gqqprd0=;
        b=WIYEL1pN+cVlC+piE5EXC6ltlQFDZltMLVnzc5IIom7ZyI3SkWJIPEqUkUACrGFc7Q
         zXXdqxYr1eRMsOkfekdQeu6yJAeYI1GIkFA0LYa9qotSuyGVMlr/z6T+0QYXyYmcof22
         yULlIHHHhXXkbNLSgj2dxJe1ESC7lqyO9uu0MOTNQEydGJ9zbzjeevj48q2f4kXxDsp3
         5nQfym3Pmrry1afOT+gMrgQrF0dg9I+fXteO/FHpFhSl2+DzS9CGEuOq8wlDrr0+G9xn
         06g3IihMTdQjVMki5fjX44wcXCt+eT33BTPetmtyXmUmiO8nqhJ9M3p9DFtnUm8Cg0xV
         wVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FJWOjjSRPXGOfnYWNnwRSDQvrCXqpcbgMxn/gqqprd0=;
        b=FKrUCqe0jX1VJH65hp0y6zIZhOruGPAnByz7PedXe6KU0VGEOhQtF9+ogDP/ls1d+k
         uu7mByN5H6KNm8VgO8kj1TeuEkGQlsAfo1opsEyZhSrrwBGLeJGp9YfFLDiQX8J54hzK
         k1ceXUEesNkpXBGl+5GueweAnfVdFN4e4wVOInPovIiGoq0SXX946tMR+OyJZRWRyOiu
         GySpaPPegjYM+G1rzm0O0Sabt2aBJ0q2oPUJpNs7725ut77ZqaNXXb4bixlCiDO9D7tw
         dB3DIWYv0+eIsYIXLvAFGq8UntgSy+tPqkLvMcXAHph4+k0k0PCDBm/wOMdmimuvn2pF
         Wkog==
X-Gm-Message-State: AOAM533sGREa8lsdKvq+4sXNhEWASk1+RDt8Lj2g6HKkaZO0GvwXFB0E
	301wfThPtsmqd5jpatCUH9NImIIl1PUZYiZz3z0=
X-Google-Smtp-Source: ABdhPJxT0WoAZwAvZLzDGglZMRMduUXmWnHonB7wKqlBo9zFkMAp75SFz46Cyu4s3XEvGtLtYUbaDSPEKsZWbk7WPAE=
X-Received: by 2002:a05:620a:68a:: with SMTP id f10mr12298353qkh.119.1629052029095;
 Sun, 15 Aug 2021 11:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <8da167be-107-7797-fce-9c5b87f263@crashcourse.ca>
In-Reply-To: <8da167be-107-7797-fce-9c5b87f263@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 15 Aug 2021 11:26:43 -0700
Message-ID: <CAMKF1sru6kQcLHecz6VuDYDay5u9jJH7ckRXU4LLbe9PPOmoMg@mail.gmail.com>
Subject: Re: [docs] "If you are using Fedora or a RedHat distribution ..."
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 15, 2021 at 10:49 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   I was going to submit a minor patch to correct company name to "Red
> Hat", but I'm curious about the wording of "If you are using Fedora or
> a RedHat distribution ...". Since Fedora is kind of a Red Hat distro,
> is there a better wording for this?

you could say Fedora distributions and derivatives e.g. RHEL or somesuch.

>
> rday
>
> 
>

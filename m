Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0ACC624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 13:32:30 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29564.1788183150226455633
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 06:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kij06+Ge;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9390dd46b45so185975785a.0
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183149; x=1788787949; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1FWm6KEpUz0zQLzIhCGs7+4nqYx9pdM+Z/2zHhwBqA=;
        b=kij06+GeVUk2H/iUkeslz8qMMYuL1Ye7XEu/HhDcmJIy2PJYTzpuAmb1iUvEig8yv+
         qbXjwmfw0D/SgYgy78pPosXvvW8eYVhHQKss5zn4sCJ2N+rb9lhaRucyxGOU2F6iP0Sm
         6x/6C+CW+X0CymKV0K0A9NlO3DWUA3JDZ8uC5BkeLJHAV/wmf1PVPAmzqkhyYst26T1v
         iIFYUUxOGcsB/uaXElg0He0dFGXVxQH6XcetF6fGCMXvuk96CnEonjZjgeqZjrCrRiMN
         1qL4YoPLpob8EwJ61W2FEsD+L57k0Oh0ALR/y0TtYgJs62ykSBX+PpI+69ibHWDf8nYu
         TZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183149; x=1788787949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1FWm6KEpUz0zQLzIhCGs7+4nqYx9pdM+Z/2zHhwBqA=;
        b=PJquxvGhKMQk3UxaLhkKnioxzbZGQXbOpSACCPNhKvLvPB//Nb7WlmqODfvukNHZ6N
         yVlab5jVkIIBuKWJBqH9zxPatNgwaSgl098NWa7tTEEuCOjMxCBLd5hVSBRsNbJyAPrP
         Oo/QK8WoXnF/vhkx5CzYok9X60RAsq2EU6vGXjOtt2s+bjCk3uBzCYRzKk4aWOQfsEZP
         HY8cv68LC4AKFZh99wIQ8NlVkea0OEBzohPQk9V7f9bvJtrk1udtkxMnGxtHymtbzTdI
         2ftFjJwNERECzw1/alZRSy/SRFW3FWp1OOUCvIfLNm7J0ch9YBVLG24c/qtFV+GKMRdc
         6F2w==
X-Gm-Message-State: AFuF++nmyeG9kMh2cgXwxHXsYL6AUmHySDO9dDbJ2iXWZM3l9Fn4TrYe
	qb+eH9a+gojP1J6UFaZwOeszPYELmPP5Ne/vrL9Ma466dcRJC3F8ZcrQK6jIJT4U
X-Gm-Gg: AR+sD10lKGidxhLfYPQtw6Bdffo5UT0HoPmQL/qsBWZxIZxdd+tPSIyyJl1/s8uH1b5
	gsb/ZscUFm4eIBEOT54bY2JA6vQpkKRYwd38pPmUraM7EueLbFyzme+wFjsSYR5LNVNGneVl/IT
	8UGCmJYFlGYw0LheVOrGuXG0i+TPgUzoxYSMo2RVb//pfinaj7Hrr/q7g+m8hufmL2UifrXyaTE
	zE2Ayg0FEftaSNYLNgeUl0YnzxgusCVEl8xR9vTsp/Edw6iBUZdmNxRDNqQMQrQ3UfO85swtoYd
	/SgUK7WQZqkdghm2CvIoW6/jOh6O5nEnFpBb1+JF9Hgu+GdKeZzSwgbzdIhDoo9mIp/GuvLIcKN
	2IEhPJdKldgyOfEAPN9YlicmajJL/kEDfut9rSYle1eMjLUUyAejdCFalQxnpEI2UUNbrPgH1hq
	euzqmCWWZAq+5uo7vV+h9Gmtn1HWAd1DIAvjr5ApzfnoxfVRl7EfEe5Acb5DybHs/OF7diMMK3j
	8iT2yTAjz1ZKAX8msB2GAfeESvAweWLJt2KAQWw
X-Received: by 2002:a05:620a:2847:b0:92e:7ba3:73e5 with SMTP id af79cd13be357-93948142240mr129423285a.42.1788183148840;
        Mon, 31 Aug 2026 06:32:28 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917422c4dsm793907885a.45.2026.08.31.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:32:27 -0700 (PDT)
Date: Mon, 31 Aug 2026 09:32:25 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: document the conventions used in the manuals
Message-ID: <apWCaeB2azEgKMlK@localhost.localdomain>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 13:32:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10424

On Mon 2026-08-31 @ 10:18:42 AM, Antonin Godard wrote:
> Hi,
> 
> On Mon Aug 31, 2026 at 5:14 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > The manuals use angle brackets for placeholders and a prompt to mark a
> > command, and say so nowhere. A reader can only infer both, and one
> > example reads as advice to paste a line that will not parse.
> >
> > Include the new section from every manual, the way the boilerplate is
> > included, so each is self-contained.
> 
> We already have a standard.md document that explains these kind of things. I
> think it would be more appropriate to add these conventions there.

Oh, that's interesting, and I hadn't thought of that.

You know how, whenever you pick up any programming book, there's a
section (usually in the Preface) that shows you what typeface is used
for code (versus prose), how a "Warning" admonition is drawn? That's
what I'm trying to recreate here. A "conventions used in this document"
section that is *reader* facing.

What you're pointing at is a *contributor* facing document. And it's a
good point, something should probably be mentioned there so that
contributors follow the same conventions throughout; it helps make the
document look like it was written by one person.

But I feel that a reader-facing conventions section is still warranted.

> Thanks,
> Antonin


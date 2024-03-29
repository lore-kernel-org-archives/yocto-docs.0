Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B77C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:41:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.102])
 by mx.groups.io with SMTP id smtpd.web10.14848.1711712503247595039
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 04:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=cBckJezM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.102, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZP5WjI16QI7qaY392BMPRtddTHZNjC8H3y0lPn66arlMdV8lWydbD+3VFBl6GmAXFgAKlkN5JRx17j81DMVkLjmWH1BlHC2YswUO0crDLvL75a6YbM7Amt2Xs1HBukmwGXYbItViHW/W/IX1pLtbsXWuA+NJwsluR7k95KiyQoAgG/C45LZN8ebYGz8AMBy5Ye1hzp0LxxqFYKsp1moijURYHpHv9W24P5er6fu95dEvsyTKB0abq/2SIG3c/ygwtNZJuV0jIySROUA7GG1IkMDuKkslKfvyyUJuiG9Ppd4uDIlXyncQdrNi62L6W3KTpUpQi3r+vwo2zb7WBJRrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAqf1/dKb/I9R0JZxY1FBnWNmRqEb88ST1zrxNVs43o=;
 b=Bz6wUW8qXFWvbQ221IcJIjwz1oQC+tGVKe/sfFeo/ViI09vTfuOQXCblnXJylLESr5b5t3uaiuoH81aXwX2QSS9sdMHzwu7lofKTI/toNYNqNNlXfowlgHU4OuOG6bC01uhRYxTPr31V6dagfAat+d4YbmRjWN7vgCqxfxA6z8QUne3ELzsgjmAKXKmna1lhR1DnKNqG7p7xaC0Tbhugwv4JHgjxEvpSzzxZS64EMYWfwRjLh2lHQQgIH/+UtZ2YzDwqa42Uepu0L97oKCr2sMCNT6OSG8zwvR6eMkBDZYZ8v/507w70RtTP0AyC0XawxC5ZjKUZhwObyg49erTSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAqf1/dKb/I9R0JZxY1FBnWNmRqEb88ST1zrxNVs43o=;
 b=cBckJezMaAAyik79brbR6zzDcPZQENNL/C7dmvo6JEWArG3pkWqPolbCvpg5Z3BpLxoab0t2g3yEEUfCPHWUc6GhJZm70svGZvtZlhORgGJy/49WpJ2pKwclmYwMVTQ8JyV7b/qz0c1pSqbb4a4sx5H3T3DcW/dESX0gIukThUf14fz1+uSzEsIPxlYyvNIKqo6/5De0lWNyJ52QV9gALnMnpCvHDptbnmuJM409UeppF9P7ZilxyrX2nTF3dPUVsQpIRmwGqkKt94Kke0TzDaYP8WT8o5ySUiG8ZKNYjg4kWZX+lsNzu8ojpMeXTljqNHgfkPV60B19Yl36jtFUvQ==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 11:41:39 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.038; Fri, 29 Mar 2024
 11:41:38 +0000
Message-ID: <f45ecf80-11ea-4105-af8d-274fccad802b@theobroma-systems.com>
Date: Fri, 29 Mar 2024 12:41:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] contributor-guide: submit-changes: fix typo in
 URL
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
 <20240328-yocto-patches-v1-3-1124fa0bc532@theobroma-systems.com>
 <8b03f38d-4664-47da-b1b9-b0b6b87e3115@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <8b03f38d-4664-47da-b1b9-b0b6b87e3115@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8885:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NWetVYP8qsHQTF0mcembLePJmLiWxdTtWpUrNZjqwmOnVUiRDeugxDfM2D2opDMPYGS6KvH+/r+Mf/3OkI+rYE6mpgW9lrdRHx6UzyX6h7NUEZkbjg9LXUjaCTL8RPxrOG0jzDPiPlfmHMX+F77mn/6hJ5mT7A7WHfuSi7Lt/sH+226Xr9qBd4z0u7+Vpnfnmv2clD7pOuiCZ76dGCWI21DR9MZIlCPs+s+LseN8L3fi4d7vg3lpeT2OHyd0FhVPjte/3/Hty5FSu7AWlBSz6cJUjmRs3D8Vs8jwDBAXd+bTthiEJ28duArpY9lh6mo74zWLgV7mTf8oeiDGb0dPkOhFco40063e53c4aZotjSDztoub2yvOCN77xhdLdOYUDIgH1O5+dWMThxx2c3RJ3byO9+VE0740eQSHfdrvqPpUprFlmGY2TZ337RPHFbQIFgz8ThKWfPGPpRxtNFCUitbwni9tWAWViwOn1vhT9LN8mQ0eKYGzDDXCUwFqzEKtwV6ChPLr/BW0LoLjA2Nx3UHzqESpsRt0GqBttSpH09veFpm3pehbnD5rlMVL8TWciq0LUXftf3O3KJLWcVGeSQNZntndf60TYqdBTKPJGpU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IbeE9fYIcev6HotA9U6TyU2e6fn5ncLYc7HJCWKC2eSEzeYQJSpMnaQ43yIk?=
 =?us-ascii?Q?f+shnM+arqWMqvpiRAMdNmyjneyqm0oakeBt//We8ESON9LXUJdyAF3P58wN?=
 =?us-ascii?Q?SIiLJrt1SLDcv6jPmFoZQlBUTBlCx+e81tRMTO1/J+dg5ic5jw39ex7jgGMf?=
 =?us-ascii?Q?Ap6dxxeq9HaF+Gz/agR8OfYLt1E9M40RXetWxuXejixe7rOwFEMPXdxcX4FL?=
 =?us-ascii?Q?WyCb6ExoQ6cjW+LYkxEFDuF9EZhKcr3s4nAyFmaKPNWj2OFAYtnEdhZ+8aF8?=
 =?us-ascii?Q?mxxM0CTkZ5qyT2+pqx4/KwPGVZKeiKDny+1gSknp1/f9TyQOsUczCqLmeHPd?=
 =?us-ascii?Q?vKP4VrRl5JmeDkXoOegJCC28zLDNx67n+0JDFR/R7cuoacYj/eAQXl21Vk3X?=
 =?us-ascii?Q?Gv7ClaCsKrKfItZP2YBngOhgfYoC16ECjde5w0UkIxE4mxRzS1Qrz3P2fx/H?=
 =?us-ascii?Q?3CngHwcfr0g7DpwudN4huOsAAyBTt5SiytTrGlhYAyz+T4z03e5DdVEcSazA?=
 =?us-ascii?Q?ucUdxmdTskpI3KWS2fNREi0qxPlVqsksV2PlrNPJhSezVk/vXGyoSxxjYE79?=
 =?us-ascii?Q?H7rjI5uZ4BTPb+/f+0rcLP0dDxQIDJHxsYcDxxolgYts1vBijZ9ysyyeiBjh?=
 =?us-ascii?Q?H92EbLH4EyrUUpd0hfRT3pmnaBdsVXaveOYJffJOpgZrmlvFVBVP7gw83IbR?=
 =?us-ascii?Q?vHQPh412puPdhFbKWjAxmEz5+tFjuUerPUfnoWwckbPADjjhrzXyeIEk1YKw?=
 =?us-ascii?Q?1/Pnx+uQWze3amN5H9GSvy6pjwevhQ0DaaEk3jRTkYkzA0YSxIvy6I/l45da?=
 =?us-ascii?Q?0kvlktXeTkAGoM8IBqtq+hVPyYMs6z/PFYns2dY57GvATS+upBpTpFfbQe8N?=
 =?us-ascii?Q?oWVgAGNqroWoW71u3UDCP0yEN3WtXAYnaqwb7vxjTmJuJjIUsAcWHmHUExpS?=
 =?us-ascii?Q?ylCIx4ccgJINyetTttFX2Lh9d9ieX/jQGs0WjiAWEYwl3EDq9lfOLx1mhRbs?=
 =?us-ascii?Q?w3fzF4KNmBOO4A2eF/Io4VnSrrgPHf4A6rkAfLyVXNzW6cFqyVYXu3rXQ4vB?=
 =?us-ascii?Q?tdYWp8lp3sFa3xbY0Q6+AkUvytf4tuSGYIkdVpZLORl03hSaWV5SVKGpmjDm?=
 =?us-ascii?Q?nZoscu3H0oXmwCyCUPAuBCe0d7vDTP6cxAIuCUp0LYKeI5iKu+qXLJ6hCngy?=
 =?us-ascii?Q?wUUoqPf3KOeQBAE5oL5DbWbdKB8lptL/cqjxD3DbAfH5HzoE+znPQY7oQrQM?=
 =?us-ascii?Q?1sFtDWSYw3Jn3/meiaExx/JsfoPZETKyFg0OwrxIFSSqd1JFY+fCq4+FrtfK?=
 =?us-ascii?Q?74IYbvxuG8c0XHuCgiv+g46y/SPZNhreU9LEAPdjvQDlZVxPPXpd8KGBQilx?=
 =?us-ascii?Q?l7GF3XsulWhAUqXL3VOohpCDI7C3JPA270oeSpxzhIpRVdZaPu8KTQZMl1hV?=
 =?us-ascii?Q?I+aY3rpJ5EmdTRdYKf+OLQ3J8XMbKzuEfiXYNQLFXPNtnJnKQTfz+sXIb8ih?=
 =?us-ascii?Q?ip22GIyJISrm99PyH5kKUBRAZ7lPSV3pDNrDzQCPRNwzzWmrKEqBw1e1lJ0o?=
 =?us-ascii?Q?5h0TN/cvpEguffg6CsDKD1AYH6RMbRnldqZBbPaHF7L6aOxXSkHhxf2HmVSs?=
 =?us-ascii?Q?ZpNZm+rOrbSoh0sH0U75/+sKxcfTg9Mq8NkY8NhWNoloS6rkYsGVtvIJ8uuo?=
 =?us-ascii?Q?L2leJQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139ef955-0943-4dae-848f-08dc4fe53213
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 11:41:38.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkubINCVhyvztUIgUzB5qcQWJmrvEAuM6UB6n9zD4auIcld88UyA1ffTB2vfGKvwMJqV63IWOa1eyJOn6doRPxJBbp6rK5WFjzPfsdtydSfv3qgYYbo5qOvLSPXh8g9P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Mar 2024 11:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5031

Hi Michael,

On 3/29/24 12:21, Michael Opdenacker wrote:
>=20
> On 3/28/24 at 16:07, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> lore.kernelorg should be lore.kernel.org as the former doesn't exist.
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>> =C2=A0 documentation/contributor-guide/submit-changes.rst | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/contributor-guide/submit-changes.rst=20
>> b/documentation/contributor-guide/submit-changes.rst
>> index b5a6e4240..baba1b659 100644
>> --- a/documentation/contributor-guide/submit-changes.rst
>> +++ b/documentation/contributor-guide/submit-changes.rst
>> @@ -438,7 +438,7 @@ their e-mail clients will default to including=20
>> your email address in the
>> =C2=A0 conversation anyway.
>> =C2=A0 Anyway, you'll also be able to access the new messages on mailing=
=20
>> list archives,
>> -either through a web browser, or for the lists archived on=20
>> https://lore.kernelorg/,
>> +either through a web browser, or for the lists archived on=20
>> https://lore.kernel.org/,
>> =C2=A0 through an individual newsgroup feed or a git repository.
>=20
>=20
> Too late, already fixed in=20
> https://git.yoctoproject.org/yocto-docs/commit/?id=3D5962a09a120681c1328e=
05335c2f14fad06c63ce

Mmmm, forgot to run git pull before starting to write the patches :/

Thanks for the catches and sorry for the noise.

Cheers,
Quentin


Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60821C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:06:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web10.9745.1670580365066786322
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 02:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=LvSEYIct;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.54, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrXwaVapg7KSf4pwYk5ej4KWtA9Yjn/LTWF3+Hv1cSFt19KuHcSKBaaUnpwr8rPphQSf+vAUa7PdQnPGFmuxKa0vhsO/JgngREY7p0z1LqVCKLy8/8JvykOVLVofmssUCk4ZobASodg3xcVbmzARnPjZoGWVRCRMUyxQlW43QkrOLw92njjOhZ4/KkM8CTJdu7DIVpE8eyv3aGSBTBUOuyHNr4DRiCmegLL0qTNIi4QQdttObgZjzBHdOy+bLyoqxjG6u7LLgVA2lCA+j+IkZYJ5iMUEkVO3Nfbo1W9iPwDRyMauhThIa+h0+fSbg8NkHe17uCsYDrtm0oYXNFPXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtDl4l5tt29dOQoOSS06esIVCZ/8QZ0dr5qhSivSzl4=;
 b=hVG5642GzMAQMJXVzUVkqlkeonlTRwAXLRk12VT9gkD6T8LVGgSePMvderP46msbIV/ZOfiLrZ8NHGplcC6Btn9j2ACbgCPoIcghUGIW4P8oXLxtCqbP1613zc58vmD/61M6a904Nkdy9KWuViZ0Qxybu3Tsciz01T0GxpNRY1cEd5EYWV4BIlJ4wj1hMIxnIMkAcnwX71JuTT13ppTXq6/3xDPj3cIA7W/vNAxKPlmtapVB3zu0wBu89ckS7LGUZ5swNah5eG2vodYFeMu3NrXNsmV0tUZtbiBsQgqhp6G3zWVirtpwoTR9LDqxSEoIZhrHxmRUlREAJRP0xQcDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtDl4l5tt29dOQoOSS06esIVCZ/8QZ0dr5qhSivSzl4=;
 b=LvSEYIct4Ty11JKOdWUi6sfsJNJoBR7tUlCtySgbJ/77p3aFuPt8hODsAb0WZzPo5SfI9dvkLI8+t00ONCk8uK2o8cPOGTGIv8mgG7VSQCsC15QWKTxd32MFRIijWiVQqXN0J06oCJ7kAqNtZWt0T60nKHAcLZR62M0w4mWDY2g1nGTSWdMZGnnWEIQVVEjHqDu7zUkrpEzQM7bSHngzpceIqPHiIUOeyXKWORhih1br742/JgYn54h8AuYgOahzx5geOsebQyuR86mdaaXyCS7Jm5VpUVE+vWqHqXm/05PDdiDvljDvJ5R+mMUXwFd7E6/tWxocca4p4N2Tp5Yi4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB7556.eurprd04.prod.outlook.com (2603:10a6:20b:2df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 9 Dec
 2022 10:06:01 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 10:06:01 +0000
Message-ID: <0238be8d-2341-45d5-dd5d-ebfd1ea1ccf1@theobroma-systems.com>
Date: Fri, 9 Dec 2022 11:05:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [docs] [PATCH] ref-manual: update references to release notes
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221208151610.20370-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221208151610.20370-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d8f811-636a-4ccb-1ff5-08dad9ccf9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xoyh8HIhyC5MR2mW4OaokFxRHMVF7lsYqZ8aR5MQjnli06qd9GASrgeuOIrtpbaqmv+3Am8wpSuK2PeyLi91eYqJcpm7ayv6ufDCoOHscVpP7vM7XbDqMFNNzmS85s6pJxVidLWRJUymdt9Nf0jN++gOshrIesB6YsJhoG3+5ZL3xBau5ON+EHtVNkOh8L2uN2ClR8jP8vZvkhRx01BTg9Xi91AvIiEgHRf34DUHJ+n5AHkpAGyZeTFkKw1NCld9Vt3egdspSfjr4wac9D/wJik2oN8FM9ClwlBH7QAss6d4ymBX9jWxYwVWG550W3Ft/uboCnwxNyiSNBd1Wm0j7CxsY60P/W+6ceriWiLJ1e/nVEIQb/ss14KYEKpZNJy7G85mDsdfGcQqq36LdqtQFlM2GrFBhZRdADYx5pFfP/YpNSr/Pf1RbySt+KCjDjRmsq32nORp5gNeu50Lu/BcXHcYyKL8APr9A9idlAAsWWe+NbB9wmlPmmtIL35PCk9NDueLHYarrMZOF59ekiMYXrcGzPqNtgDjis7GWE+2ycT4WXbioXT1fOIiM56vGV3+i6pOF+28P6vbf0fGEy4T5cC6wpfF7Xcho/LQGYV+JfCLA9TKNyA75sCCt8+3zSvWwbzfs4iDOcbMtZvVx6ql9RBNWSbS67aNlduLAaLsGKau6sg7Y9Okg7PVqeKzng/XlhLQqnXyGVv5ML04+80NOGBBa2r1FZPBYgKTO8jpdEI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(451199015)(66556008)(66476007)(66946007)(8676002)(6486002)(2616005)(478600001)(36756003)(83380400001)(5660300002)(53546011)(8936002)(6506007)(186003)(26005)(44832011)(15650500001)(38100700002)(2906002)(31696002)(86362001)(6666004)(41300700001)(6512007)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SWt3LzNyWHZiaTZrWFVid1dET09ITHBFb2VzMk1DQUp1dVFpMXQxQzN1eHJW?=
 =?utf-8?B?Y2FtcG5MZk0rSVlidUdERjE3RHpldlFzNEk5cVlVK3VsR0hpVmE0VHBpK2Z6?=
 =?utf-8?B?cXdlbXY0RXJXcGVQTHg0Y1BJS0VJdkVXRUdYQllNUDZvMHRDVDVmR00wZUFy?=
 =?utf-8?B?dnZhd0Q3S3I5R3pUc3BKelVsNjJNb0JmOS9US3Byam10RGtTaFNoaFU5dFFF?=
 =?utf-8?B?N0I2eFpZRGoxZm5qVzhoRGoreVNBMGx0QVVNV2ZUQjFER0twR2NSL1NUUTdV?=
 =?utf-8?B?eHFUL3Q2cGpkN0hyK283SXFtbEFvbjZMTVlGUU04R21Ic3g1VTV6dXJtTVY2?=
 =?utf-8?B?RjJiZVdKNGZyVUVaeEtEM2txb1Y2Z2xKdktmT3c2U1hpb3I2eDBxVWlkK3ZE?=
 =?utf-8?B?WkNDNWhWMmFZa05MTk9RdHBoZE1VczU5MEY1WWpBRlUycDN2N3RZV0hwdmwv?=
 =?utf-8?B?dmZYUUJCU0VRdmZKV2dBRC9aZ2d4bis3QXZFbjVEbFpJd1p0UEI5U3ViT2VJ?=
 =?utf-8?B?b05Wc2pMY0hPQ1VabWJhdlNRYUU3WnNlVHVGVUVSMUVEUS9NR3VzUmJiV0JK?=
 =?utf-8?B?MXZySGh5RjFyMDFjeDZ0ald4SE1sb29QSHI2bzZmL1pkRjMzTFAwVWZ4eXY4?=
 =?utf-8?B?S0Q5ZDFCVmtHY3o4KzhOc2JyYlV4UjZvTlVJdEMvZllmbmVyY2lpU3UvWFZC?=
 =?utf-8?B?RmJSZjM4alZKc1M3THN2d0NOdFFpWFRJalIzWFcxdnN2TGRZSWxzVUk5b1dm?=
 =?utf-8?B?VDhMd3F3cS8xVmR5THl3R01zMHBueUxwdS9kT1RXSUt1WDBQTDdQSC9hemJH?=
 =?utf-8?B?eHJCdVpNUTB4TDhWYlFpd1BBL1Y2bjB6K1JpM0FZQ1JMK1h5YnlFZ3M0K1Q5?=
 =?utf-8?B?S0pNamVaUmx3QU5Hdm82S2NSR2J6Wkk1OS9CRzNkcHJIN1pBNEUwUDluMXk2?=
 =?utf-8?B?djBwbm83WEVZREJ2KytYVVJrQlE3M0IzR3Exdng4OVFaTVBOT2kzOTA4ajZJ?=
 =?utf-8?B?c3kzVWNpeTFUVEU4ajlEMGtxcGZyQmNXSmhEeUxBRFMyS0pZcG9xSzdpcE5U?=
 =?utf-8?B?UEtpUDJUMlZ0QmFIeFFHWlJxRWdEcnJpZkRoejdDT0ljUmY4RDN0cjNKWGRN?=
 =?utf-8?B?S1pQWWVwaE10OE92NGVJKy9sWmp3SWtxSmtWTFJ0cENBNGM3a1lKblJhRlQ5?=
 =?utf-8?B?Y0Q2dUc0Z3dnWCtaM0xYVWdIekhsL3VEME05MytQMG1udTBsd29Vai9oUVlR?=
 =?utf-8?B?WjVaWE4yaVQrTEIxUWFqUjU3Sy9zMnpHNUtHR2RaRWpTcEhDVmFCaE94dURL?=
 =?utf-8?B?YUF2N043RVprRWR0RnFiZHdidGtBNlRpSjJEaklmZWw4SC9aYW1vd1Izbm9L?=
 =?utf-8?B?cWkrdWJCaFFzMHh2OW1KMlNOY2t3ZEdycmxrRmcrZG5XaHpTSUQrV2VkWVFh?=
 =?utf-8?B?eTBYZFh0VUVqdDJhWnRaY0R0RXZIMHZwWExrcjlsYnhUT21OcGNTUy9uYmVo?=
 =?utf-8?B?bkR1eTJaMlFYSVFObXdqQ0pQQlk1Q0s5RnB4QzJJQ0U1MTVaeCtOTDY0bS9P?=
 =?utf-8?B?ZjNjdU1Ha3prVmdIREZRbGJxMVZHZGhOdU1pbVJzT2JVQkJXUzl5OHpHclpa?=
 =?utf-8?B?bVlDK09vYy9uMm1uUnJsNTNSRmlXb3ZrYkE0TlhUVUo1dUlreXFITXBtMnA4?=
 =?utf-8?B?bHNyNWo3R0RKZmFzSi9kL001ZkZzdnNpWDBFbHFOZVA0cTJ3S1Z2OXFIT2Zm?=
 =?utf-8?B?eWswVjlFSUwyamZScVRsSUJ1OWRpM2hiYm9MNklWOUNtUFZDZHVrSmVacDNv?=
 =?utf-8?B?Yi9zTXBuL05YM25GSXE4Nmlsd054OUtsTDZXajhTRmlBZzd5cTJrWmNOQ2hN?=
 =?utf-8?B?VGlvT1FwSG80ZDlVN245M3krOEZvU1d3dk13N2NhWkFlK2Nza09TZkN5MEFl?=
 =?utf-8?B?YUNUZnZZVnhKdHhJbkFvZTBDa3g2RWxNUnBxR01zQ3VMYXZPSFdEcWMxaFo3?=
 =?utf-8?B?NnhyTzdUMllxVkQxTDRnWGhDdXlGazEwa1pFcVVFanlXTlIzT0NqTWlPRVo4?=
 =?utf-8?B?dkR1WDVRVjFlMTI0c29ISEVncHA0ZEtxeEJLSHkvNFVkZ3MxYTY3SGF0eVlK?=
 =?utf-8?B?TDBQVnJsbWxwckxyVy9lNU9XOUpjUlg0b0xhNndTS25OMlRsME00N0ZxdWY3?=
 =?utf-8?Q?F0vpNt5a2Jw65cfdbKNuN18=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d8f811-636a-4ccb-1ff5-08dad9ccf9ea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 10:06:01.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njgtsjokVQdXEHKfxHpCQoKFJOONRXz05okJWOjyNHrbmaRnVGSLEYQt3MDa34gPUevzqL37fufLoHzjNMJ6/paxGv4UidefsOT/NS/pNps5+cz7m/k1Dc/AGVxkY+2D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7556
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 10:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3534

Hi Michael,

On 12/8/22 16:16, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Now part of the Yocto Project manual.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/resources.rst |  8 +++-----
>   documentation/ref-manual/variables.rst | 10 ++++------
>   2 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index fd4aed0164..06644363d5 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -171,11 +171,9 @@ Here is a list of resources you might find helpful:
>   -  :yocto_wiki:`FAQ </FAQ>`: A list of commonly asked
>      questions and their answers.
>   
> --  Release Notes: Features, updates and known issues for the current
> -   release of the Yocto Project. To access the Release Notes, go to the
> -   :yocto_home:`Downloads </software-overview/downloads>` page on
> -   the Yocto Project website and click on the "RELEASE INFORMATION" link
> -   for the appropriate release.
> +-  :yocto_docs:`Release Information </migration-guides/>`:
> +   Migration guides, release notes, new features, updates and known issues
> +   for the current and past releases of the Yocto Project.
>   
>   -  :yocto_bugs:`Bugzilla <>`: The bug tracking application
>      the Yocto Project uses. If you find problems with the Yocto Project,
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0435f88347..776c8a2792 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8465,12 +8465,10 @@ system and gives an overview of their function and contents.
>            If :term:`TCMODE` is set to a value other than "default", then it is your
>            responsibility to ensure that the toolchain is compatible with the
>            default toolchain. Using older or newer versions of these
> -         components might cause build problems. See the Release Notes for
> -         the Yocto Project release for the specific components with which
> -         the toolchain must be compatible. To access the Release Notes, go
> -         to the :yocto_home:`Downloads </software-overview/downloads>`
> -         page on the Yocto Project website and click on the "RELEASE
> -         INFORMATION" link for the appropriate release.
> +         components might cause build problems. See
> +         :yocto_docs:`Release Information </migration-guides/>` for your
> +         version of the Yocto Project, to find the specific components with
> +         which the toolchain must be compatible.
>   

Where is this info located exactly?

Cheers,
Quentin


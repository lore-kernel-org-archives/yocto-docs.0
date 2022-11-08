Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BBBC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 09:42:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web08.6172.1667900545533609160
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 01:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=hB/0cgnD;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.57, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMUHmVSkSnMfaS4/Md1BoSwinR1GgDd2iBhjfe3VT77Prjt4ehe7gb/H5WUImV5vjmK3poPvbk94FtOgHpCLYy/oLaADAc3SN5ucjSt8bahvzu4n1WGBfPEQT1GmVER3ZbeL2UrOSlS0mywBLq3BOIjl8jNH2g2/eAoaqZRMd1Plk1tBskKfPmXRjSrA1SkopKAwPKENcYVkMytRBtlyUMii1QIN0y8TtvbP9GJMZoCmU7RMNbactvInd/wMgWHzC7Sw62gsU++TXGYTTB/qZUYiDwQL5wqQNrTQ5rr7gM14yFRzu30qq2YQwmxFWDDKWvN3HYLgNTbdigDgM57ciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh4mT7a1KUyx68SjDlRvb7Z4ibdZmnTZjPfJac7T/Bw=;
 b=FpCMhM2OL5ej5VMPwofhPRYPJ52wyEBDBP4mKVBLJzi4efdpFTvxWDBgfTnJLoVEYxS903OQBBnu9hb1zBWIW2KittGQCITCxVpKNy1r5pmtheloK2gMZYMfAjd/mjIc1cu7fH7PJX4vQ9++nYnAYeLiI0l/I8G+wl8UB5LU5N3GJNcTmM/6xqeVMCAHtbha04JTU3eI2RgX1Naku0AeQnm4ydxb0ESDnuFYCHZMpjiDkPKphhqFbRayavpoIvg8ObEcPqDrlK2GssGBDKyyEziDyQaNG2Qy9lwSzPckFLz/h0+S6sS+/wle9PXE9WT6KTK631C/cpRWL3Amy7bbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vh4mT7a1KUyx68SjDlRvb7Z4ibdZmnTZjPfJac7T/Bw=;
 b=hB/0cgnD09uLqApnXTrF7ibDnBNhsjhc8nH7KVtZPn+wfJ7DL8hctiWVZzLpNkX9gw2iAe1bdshTTVY1wYokm3xYyoLjUKUSOhChCfy18dRC+A30dtRRFp/KT44wRFVPnCcu10mErkzrIEWAb1cnYBXlmM35bQvwYH9PyvqCqyW8PvQ+lIEmTAbvs1eJFQwVuAgepMuGkmhdY9tsNtfV7DOTr0DpOd3vaS/N+lPrpTqzcSQMEW8rJ/OIfgEtRU/hOgvPj5bL0QjsGwnAOzz1wj8FaRUq0rCCDpJdz+ZpvLNDMwQ2f/MLQ7b9PJ7yFbma5ODzL2AA61MK1glQaVXvYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Tue, 8 Nov
 2022 09:42:22 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 09:42:21 +0000
Message-ID: <f2b14e1d-5d7c-9955-e07b-4cae8889be39@theobroma-systems.com>
Date: Tue, 8 Nov 2022 10:42:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [docs] [PATCH] release-notes: fix links to git.yoctoproject.org
 repositories
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221108084137.440012-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221108084137.440012-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 57354da0-7803-448f-3fb1-08dac16d88d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jrDPi1RaATUNo4zD/Mz6bnCtrLxokoGZodRDB/Oaan+d4EbvSAbQFgcos9SBD0AbzX5LbDxUewphwOrrk7qSE42AtfvdCvenMNEdXbsx8fN2eKILdfE51cE3w8p3MFXzQDYxoaL8tVXfztywtK5EyiQnyIKwWh4n8bwcsMpZuPZpL5ts1dghsx0nHU61RcAXRFv0qS6DpVRmuIMK7Mzjr/0Ym8ZDEdG1Bb0QdY5VFZFki6xe4sX+GP/RcEEt1Otl9g7rFF39o7W1+7GHCAQOvxZJLITtDk+FmbwTYjJGI/hTqZ3w/zP4fQj1uHEMduRWfTcKRuktlx8jQ2kOSDA7JVNtQObBr6opebGuEsCwy64Yn9FlLbdNBGsto4pei4+s/SwWrP3XrKPuv6Cb+TX3SGwNeAkekgudzsl9q8rTLqHeVDQCNLLAXnr4VNpmBAJO3/w7w2o+Bkh+z6h/HOof3HxfhY617ctI0Bf41MzuMU25PVeqihLQUnnpRYhuyg9XloP2pxfh2SPTRBittUo6sHDgC3yOZaAX2xGypSJH68KfoXMpn/LaRCT/3a6ZHPx7GW3s0IYnDW7/KDQ3XGOfiwr9S8JmL40KP2dpGS9iXS+oxS3ygAz9PgaP4dbPZWa6lCpy+waP0FVyGVVLOkbv2pT0rRFA2xAPKfWeSuJ5QFltj8JyeiWxtMTqTWWomxZlqNpMpExedJtXpgwBR9DYRaT1Opg/qD7QOyPRZh0zLtWeVDpY9h7A2C7BvROIGMJA5P7zCV/ivaU6daQ8BdnVdBzJaZNlUjk7XWI6vT3QL+m1m8hbut1skG9N2tvPne8w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39850400004)(451199015)(31686004)(83380400001)(36756003)(186003)(2616005)(31696002)(38100700002)(316002)(26005)(53546011)(6512007)(5660300002)(41300700001)(8676002)(8936002)(66556008)(66946007)(66476007)(86362001)(6486002)(2906002)(478600001)(966005)(6506007)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlk0VU5FUENseVhFRWx3N1dxR0FtTnIyRzlOREdiNTkzamNjdWNTODlGdDNJ?=
 =?utf-8?B?d2dldjVBYUVUUGJtdmtOYmxRNGxzMkhEY1lFeFZQQURUaDhjYUM5NWZndnpj?=
 =?utf-8?B?R3ViVzdnNXN4WFBCSWh2aENiSXBrbzh1VnBsUU5wWGx5SGpSZ0hlM1N4TUlY?=
 =?utf-8?B?R2ZrWllvZHh4d2txbWcyWFFDb1JXaFMzTEIzeGU1N3psejRYa0VWQUVWWnhw?=
 =?utf-8?B?ejZNSUVELzd4OWpIMWpVZXRuT3l4Y3Fzc0ZlL2M4bE92TmE2R2s0d1lCeURw?=
 =?utf-8?B?WUNWVlV0UHBETU5MZk5GM0VjRytpOXV4Z2l4a1N4UFE4cGZoN2N5ckpRaXUx?=
 =?utf-8?B?RHA0QlN1SE5Kb2VMRTMzK1cwUGRRTGg5Z1ZRQ2lQZGJ0d3RrMEdxTS9SOUNR?=
 =?utf-8?B?dlVDQU9aTzVRazZXTUFlVjNBU2pUa0l0L2d3cW1pbnkrUC92SDdlOTk2cDFW?=
 =?utf-8?B?dGlMYjBNS3QxUzFxS2ZiWU1GTzFmaDgyNTFTMkEyNy83b0NCdlFMQWJlOUk2?=
 =?utf-8?B?TlNBWDl3M2lURTRBZ2dIbkJacUNVZm9ZV2NoQlI4cDZ1WEpOSXhzSkdWd2lO?=
 =?utf-8?B?UmRYTjdBM0lUVTNxNnpxSXVCcHlJMDZmVnZ2cTdSdy9RUmtLaGJrT3gxMGFF?=
 =?utf-8?B?ckp0b2xtemhucDBkaVVwTG8xelpXTXZvZVBuUVBrdjJOWlIzTm54bk5icmk1?=
 =?utf-8?B?M1pXeERJeEFvN0FIUXNETWY2VGhtdkREbFFkOTVPeXpYSzlBWEhMVi9nQmxL?=
 =?utf-8?B?dS9vRzhPSHJGWHNKMFhKeGZWU1B4SjBWUkJaUSsrR3NmMkk1SDZXWkpoZ1NT?=
 =?utf-8?B?WGlxdEI5bThZbHB2VHZwbUNVY3c0cThYYXZ1aE9pMHdZMkdwdFAvL0wzTG1Q?=
 =?utf-8?B?WWpLLyt2Z1AyYVVGMFFIYW5hQXRwOUc4c2Jrb09YQ3pjWHBZVEx4V1lsaElZ?=
 =?utf-8?B?SDQxR1d1TURaV1hSLzNLVlBvY3JlNStKZEtHQ0dHVC9jVDZISDBmU1RyNXla?=
 =?utf-8?B?T0h1OE1qOStuU1IxSlZ1bEx6T1VHQUxLOWYzN2o5bVh5ODBtRU5iUjl1Q0RV?=
 =?utf-8?B?U0lVSDgybmYwa3daVm83bzVPY0xZYVVERG1QWXE1b3ZwaUdsNUpsdGpJM3ho?=
 =?utf-8?B?djRUd0k5UTY4TXplOUlKcUNiVnlncnkzeENrZnpZMlBnZkFGbWh4QVJLazll?=
 =?utf-8?B?aWloRC9jTStlSThKOTVIZlM2M29nM21YdjlDR1ZsTFE1blRsdEcrUXB1NUI4?=
 =?utf-8?B?ZVBrdlNPdW4rb2phRjFyOEJLQ2FVWXFyU2VKS0NNN2dZaVQvNllyeVZ2Qm9R?=
 =?utf-8?B?TlFtOWJKK0x1MTFQYW5HcFJLU2xrcXhuNHZIdzgrakgxdTd4cGNwWkFvVEtx?=
 =?utf-8?B?UVVqbXMraXJoTzM0V3RTd1hWaWNwODAybk5jRXJTNGNCc0cyajgvWFJWSlpE?=
 =?utf-8?B?bllvamxXdzQyTEtPL3N4WmQvT3UzMnR2SVJNU29SMERLL3pJRjUrOVpoeHJI?=
 =?utf-8?B?NWpEODVUeWNYcFVuRlQ2T0xtZ21pU3FHUEhLaERSUXlncnJ3ZUJvRVZ0OFhS?=
 =?utf-8?B?L3BpcGFQVVMwLytqQ3MyQVYvTW9BMzlrTlc3aWxCRURJa3NyejVkUTFPNGVu?=
 =?utf-8?B?VVBQNjdxMWhKTGo3VzVYMjRSYXVLZWx6Nkp4cjFEK3lYNHBGcmtxck9MYm5p?=
 =?utf-8?B?L3QvQU8xV3hKRmliblZCdlFQMTBCSk14OWJXMEhySmk1bmxSSUJFU1pxMzBy?=
 =?utf-8?B?RDJrOVRDZ3RSa2ppMW1lYTFEM3R6L0h2UC9hREYvRFBwcVUvZ3VpWlNyekdh?=
 =?utf-8?B?SjNsOTVIcTVWOFdmVmtFU3BFc0o1MUhnR0laTlVMWmFKZDU5T1pVa2JKcVBz?=
 =?utf-8?B?QTlxNmxOeVp1bnpoeEFUQ1F2NDAxeGQxY0NMRkxrM1ovdWhUV1UzV2tpNjRa?=
 =?utf-8?B?Q0kvemIvK3FZUCtST0NiL2VTYytTRWNQM1ZONjBNdGNPdlNlNmlMUlpOV2Vt?=
 =?utf-8?B?WWdEaGpHbGJWT2VVczRkNHkvcWVILzZNM1JZQXhMU3hNbFBxdVZRTlhDTDlw?=
 =?utf-8?B?a2dUNHZRUlVlNkdOTDJML1d6alNYVnVXZmY4RFdpVmN3RFJGclA5OWNUdnlE?=
 =?utf-8?B?MFc3bjRpK1FmY29xdXNncW45THRMVk1ydHFJRUtmWU9hRXVnWGJya3g0R29O?=
 =?utf-8?Q?qWqmzsP6wsQ7+Sl4Mmp04l4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57354da0-7803-448f-3fb1-08dac16d88d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 09:42:21.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZA+6ny/fPTRLJNtB15ySPgHa8O1z6V5UEIH8X4gzTvLLexbaBDDPq9Kcc7Sdar9yQTp4iXBZwIhC7YvGVVli8xv5zUc12uqJrgI5FPeMxvi9bpckixnDkRRlr9QXDj8n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 09:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3470

Hi Michael,

On 11/8/22 09:41, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-4.0.2.rst | 8 ++++----
>   documentation/migration-guides/release-notes-4.0.3.rst | 8 ++++----
>   documentation/migration-guides/release-notes-4.0.4.rst | 8 ++++----
>   documentation/migration-guides/release-notes-4.0.rst   | 8 ++++----
>   documentation/migration-guides/release-notes-4.1.rst   | 6 +++---
>   5 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/documentation/migration-guides/release-notes-4.0.2.rst b/documentation/migration-guides/release-notes-4.0.2.rst
> index 632af11297..66779515e6 100644
> --- a/documentation/migration-guides/release-notes-4.0.2.rst
> +++ b/documentation/migration-guides/release-notes-4.0.2.rst
> @@ -230,7 +230,7 @@ Repositories / Downloads for Yocto-4.0.2
>   
>   poky
>   
> --  Repository Location: https://urldefense.com/v3/__https://git.yoctoproject.org/git/poky__;!!OOPJP91ZZw!iFetgeK0FKPhWY9l9OmtaBEsOwkPc1L0HWKAFUnUsaea-gCLTubugm8qEQEVHGhnoIj54aP-HLOMJJ95046-dvgruDZ4umiPWW0jXwneArjrhbRYVq0e$
> +-  Repository Location: https://urldefense.com/v3/__https://git.yoctoproject.org/poky__;!!OOPJP91ZZw!iFetgeK0FKPhWY9l9OmtaBEsOwkPc1L0HWKAFUnUsaea-gCLTubugm8qEQEVHGhnoIj54aP-HLOMJJ95046-dvgruDZ4umiPWW0jXwneArjrhed3wcSF$

Sorry for the URL mangling, company-wide policy I can't change :/

What about using :yocto_git:`/poky` ?

Cheers,
Quentin


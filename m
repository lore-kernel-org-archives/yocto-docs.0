Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF62C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 10:30:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.67])
 by mx.groups.io with SMTP id smtpd.web11.3994.1668162600270214267
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Nov 2022 02:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=eeNfN/7S;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.67, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TviP8fk7cN7m37GVPAT4Lqf8sOTlTyciszlMYDVtzeV2Qg5hXp+tDor4Fv30NM+Y7OzMWvBURbP3iBgjT29eKf6mWJ1ccfWXs8g36U8WVTSSmxp9up3MvlLi01zJQoa7BpKYf6xlwiy+2hc21mRXfm3Pq2FOPx+lCoZ7fbUGiNl20PJ5U25B7uMhTy1QekXlXpgiRVIA6GA0ZNiaWNmy9S2uwIMq0+/W8C2w1ISYN16OcWup3sJXs7ScGORPyMRn8FqUrHInQgaPK3x7ycw2nDSssthXAtpjDwcpAYWxzyqBbKVHc8PbOjQQkuIDrvw43ikdAXrjYkAl2qbg21awdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRtqwqcRfJFrK7BpnRZFFW/SjIzP6Occ+aPouAH4W/U=;
 b=B8iz9OXeUOBIViiqPwOtQpcJRHKNlTmS1blYguVcDsFQ9EaehfKQ3H3pV6o5Rke3ZAw48FvoS2rLRnjcbEtt31ktkEwJvGjzC/OMkr2G3/IHPTEs0UAUEq3Ekwmm7i8bId1QGnctUt5d8dK78hhsAwk9t8p7twf2OY72YCm/RRUVFmMRbajouEtVY21y5QcjgfF7WMhg0KM9Kqyvbuchm08b0BQ2r/mQwKDgz+ouiNzeXbbKbVYHjnS2n1Q6AIosfZGF9P88gyn9p4quYZIH5iDAwE6UfdijSIH8JQO4aVLc+jqqp4LZ2RZPlqR7ZnnUSQbGSw6r/se+tuDw3kYrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRtqwqcRfJFrK7BpnRZFFW/SjIzP6Occ+aPouAH4W/U=;
 b=eeNfN/7Saj0UMB8FdRIkc6ehXoPCJ+I1Gn6jtZ4ZDrt6NMEVJKv44N+iYQsvq+oU+QzDWagOQ9cvYGFSwxLUwRQZlyNwLRUa+NU8pa5qH10jL/g3PIVmhIFZR7mfPpKFxA7ABY+7gfKyi3JxA6ka7etpekK631I7kPVPpeoiaQU0lTxthoPK47WunuTj9ZSvNE1+FnwYLAty+d1asdC3yTpX4J0oO1c3Ggl6RT/vkI83V70P9lWYBFecEcuyUo94QJuT9+mMujROfp1ss9uuYzg1aFL5yCvadfzeK1cN69f2sSvkVikZdm/uCIVjKMFtBBx6FpK280LDoZlebfs4hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7814.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Fri, 11 Nov
 2022 10:29:57 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 10:29:57 +0000
Message-ID: <fedb4cc0-44d6-d7d8-bc26-c8de5bee06ca@theobroma-systems.com>
Date: Fri, 11 Nov 2022 11:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH v4] qemu.rst: slirp port forwarding details
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221111102151.7159-1-atanas.bunchev@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221111102151.7159-1-atanas.bunchev@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: d44dc482-f54c-4a47-9d82-08dac3cfae27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gi/FCcFSQCXz7bhWg4CCgrziQ2zXe7UEhxo7gRnTWlM9Umy9mOXy9d14WeFT3fjut+TOkWCkf8B7BWJRhEGRDZQFbltVHac9iJVgNHWY/K1gDPpKOqhxMplMbUz7qUeAVjhWSeyXsrY6V/jAgqceNya2yb4BitEZ/FXxA+4DiXm9LBsva+XwCEy8wpMC1nrK7sZ0LThdg0IS/jkqdzVW6FyZeznCilUlFRGUQnsZ1i68LgOv/Bj+FPFaE1tnR6Vg/L6GDJP3zwgRUxUmgXaMQ2kgUeNH1NTu2Ph70CnaE2geMwCKozTT+1AYTiCvnX5fTgBOpazgDXFwjGRopI/buyvVBWpykc+/bUeRs7VB+oPep5/9Vvr1kd88PhirP9yfE/ODdDDvmv1GrMeiIGQv0GDATQ+6/a0jCBVo2Eo+rMIThRPtqvzDqoE0oIUvUn7/3MX1qBhlz4VyIbfvxhOYzqCaQPG9FM0/sxxioUO9XcMSoXs5CVqIhzBu9JzOgiPnQINxD6oxW9bpkPG7yyzMUKmPD7gU1Qbsq59NsBffZH9/UByu+Y85UoEzryxh2FC5SJV3D3jMDl3URCBJyJmMCZWY12AD9cg6oM2vpe2ed69fA5lmpokazU6owia5WYAoDwZDtVAU38CBjxUvq6k1xo50aLsAayEboKyXR1TNRXV/bVtfkuujDlL38KljyA7DIWH2NIsFWIOXjLw9VbGc3vhoPDoM3kwK3u6eLgDPFhRo0bWsHDEg9zeXxOEw+ldrLRg/KneeFJD1MY7Rax8LFWfNwMuqQfBSawdJRavC4M8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(366004)(376002)(346002)(136003)(451199015)(36756003)(31686004)(38100700002)(2906002)(316002)(6486002)(86362001)(6512007)(4744005)(5660300002)(31696002)(66946007)(6506007)(53546011)(66556008)(8936002)(83380400001)(8676002)(41300700001)(44832011)(186003)(66476007)(26005)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TE0yUmpHUnM0OXNtOC91blU3VUFCK25MTW0wMThoKzlwQ1FUaHJsRCtWMTh5?=
 =?utf-8?B?TEVrQWRXWFNZVXJhRW05UXUrQStxRlBTVHdrQXN2TjMyOG9rTnVRa1RVeFp0?=
 =?utf-8?B?ejU5WGtmWUNSQzgxL1ExRXZLSVVXOVhMT2lOSlU3cGhzc3RpdzhzSnZTcjFz?=
 =?utf-8?B?bnJ4UmhGVzY1aklaZ3FTbzE3UkxMVmJGN3FhOFI0ampDQ2x0dFJrNWVuSzRa?=
 =?utf-8?B?REtKcUhCS2tJaEF5amJOMmNsR1lheFdhODRIVnc5MHlYK0hHZjlaRDY0Zlpo?=
 =?utf-8?B?cThXaGF2a3duVzRMQ2FUT0llVnhaRWdjTmwvY2wxNGpZK0lIcnJVMndxQnpV?=
 =?utf-8?B?TStSbG05NEM1ZEROd0ZjL3NXdWdVdGhIOTVVZnRoNUxNYnA3UGpTZjFZY2hx?=
 =?utf-8?B?UEF1N2d5R3FjNmgzem0zdVZxbmhCNk1lUWNoV1NqUGtCWTUvWGJMcHdYc3BZ?=
 =?utf-8?B?di9VZlBMTFJEZ2FvMmVIeW9SVjdTQlQ4Zkg1elFFS0ZsTkJMYnIweHFZUy81?=
 =?utf-8?B?S29KdU1pU3NQdmd1cEprVmg3dE1EKzB4NS9oNWFPZnNqTlF5V05nVk53ck1R?=
 =?utf-8?B?eW5EZHlzTG85Nm5tMWVaWnZwS3BscGtkQVRsMEJxTmpudVlWV1NROWJTVVNt?=
 =?utf-8?B?UnRIWitmYXZ1VFVaOGt1ajBHdUZGUEt4NTJnZVJ0NTRrdTFFVDczZHB0dCs2?=
 =?utf-8?B?SWV3cGlqZDhHalpiTWEwekRWZm9nT09VTnVyN0UxWi9CbEVjRzJoZGE5VHhN?=
 =?utf-8?B?U0ZHVUwyY2pRYy90UUpGbyswNDdUU2EwRnhLUTdUT3hrdlBKaWZnSHZwaVEx?=
 =?utf-8?B?RkI1Q2NvSVc2RXNrdDU0clR0QVFWQ1VyRzN3bWU4VFlWakZIK2VkSWM1c2JV?=
 =?utf-8?B?Tm9aSzc0UDNzUXM4TlU1S0tGNzJ3R0tOUDBiOXZoNjJyQlUyYUVmR2lBWWJI?=
 =?utf-8?B?dU8rUC9rTVlHYU5GOTQwb2xZWm0xNWRJRmNWWTd1NytkblVZVm56a3pEVUZz?=
 =?utf-8?B?VlBCaUlCbFhheWRGTlRRVEdtSE93RFh5TlViUFNRVk5ucXZxVGJEQURUeG1V?=
 =?utf-8?B?NjVuNEp4eWc3cW1IcW4rSDJzM1gycERLbU1yemxQazlXTE9yMWNzOXJnZEVG?=
 =?utf-8?B?OUhJaDJtRG51MHVUdkh6QWlaUUkwd1NUZjFhYitTL0cwdS9IVXRPMDJYVEN1?=
 =?utf-8?B?Ly9FZzdVd3NKWEFYNCtUUDJlSlRWY2V4M2duNGJmR3M0T0RaRytxeHkwZDI0?=
 =?utf-8?B?Tm1QclM0YllIVmJOSEdhUkdBSmxwQlNwdEptc21Mc3VUUjNKaEFRTmg3b0Jq?=
 =?utf-8?B?YjdyWGd0T25HOW4xSGVnUFpneWdMeEpEUjJlQXFXd1lBd2YyV3RaazZOd1NJ?=
 =?utf-8?B?OHF6ejhqMzZjdjdSN2xkTlNnaHdoSlhxTUxqQ1U3Y0xPbGpZakJBWGY2WHVh?=
 =?utf-8?B?TlJROUZ4cDFhd2l4bnR4UFlSUXhIMjI5Ym4yYTZBajFyanB5R1R2eHpoSUNJ?=
 =?utf-8?B?RE9UU1FlY0RXdWhzcFQ2Ui96MktHVVhBVDB1U0ZQdWtOUE4rNnFDTmZXTTVl?=
 =?utf-8?B?ZFJMNG93Nmx5bFgvL0tiQ1JRcVh1eXpnREZNSGEyL0hCYjlzUXREcU5TSVJk?=
 =?utf-8?B?bEZFaVdYVjZXNjZHRzNtRlNRSzcrL1h2bVBaRmpENkhtOE91alY3VmNvQnNU?=
 =?utf-8?B?OXJURlJIb2dVQk5hc1pDT1BxNiszaUI4MExFSjI0RlhlY0pPREQrT3RNNzV6?=
 =?utf-8?B?dkFxTWEySFFTcXVzRHpFa1VieTBiY3prMUZ0Z1Q2ZjdNWGZqcFBnYk9TNkUz?=
 =?utf-8?B?T3dLMHRIalFJRjRJcEowOWNLek5aSkxKRk0xbUhKclArcGRlV1d2TXBBUS9o?=
 =?utf-8?B?VjgrRHVENEtpZzJFTFpIMVVnUURhUGlqaUpmMWc1T0J6T1FCZGdnRk5OTzlF?=
 =?utf-8?B?RnhrS3pxTVRQb3lUaEdZMG9xQmVoSE1EQXBYYk1FZW1OQnFPaVdpYlVlN1Zh?=
 =?utf-8?B?MGVEQ2tuSlY3OEJNU3hhKzlxZ3ZoZFprakwvd0Y3WURGbm9PL3RyZlhyQXRG?=
 =?utf-8?B?bmNMdGlhU1J0NE9pN1czWTVSWWh3eVhFaGxnRVNwaUpxQTkrUFh1M2RXYVI3?=
 =?utf-8?B?b0xBbHdTZXVnOHMrQVoyWGdwSEUrT2hXTTBocktxTnlXYTBJVFJKT0ZhSG5r?=
 =?utf-8?Q?iwX1meYMuHR/TaiSKZr9zWQ=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44dc482-f54c-4a47-9d82-08dac3cfae27
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:29:57.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRRK6tffYqN9D58wspGFyVTzgt4fRB0LLrbJoUlBOqu3llqdAZodOxq2/pdBkFFWbHNMFjduWnzmARksxB6IWz5nE0TVEgicXfq357gjXTxt02Uk7iU0yElQ5lFjsuEl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7814
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Nov 2022 10:30:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3492

Hi Atanas,

On 11/11/22 11:21, Atanas Bunchev wrote:
> Explains the default behavior of `runqemu slirp`.
> Explains how to forward ports from the guest to the host machine.
> 
> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>

Thank your for the patch and prompt updates,

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin


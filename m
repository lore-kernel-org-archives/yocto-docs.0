Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3191FC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:08:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.web10.12104.1743170887714745820
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LutWYMmQ;
 spf=pass (domain: cherry.de, ip: 52.101.65.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJLHJHUuuAn41D7CXn1l0zlSnmwMT2qNKn2nkxpv9Tv+2Cfxq0xa/cG41O6epaX7hK680+wUf1iacjj+QYc7a1XRWolfQ9au147+VQyy4aUCu9uXs5vG7FX5CpIJVonAsiPMbRPtjPdg661hMBHOMsVfA8LdC3wc1Wfr+Ds8VbNUjfSZx94pIBj1T47eaLHkO2Owu4/DrFupzXd5VwfNRiAZVb88KmkQZwBua7ej9G95yxCmoR+cMEDESRFop/lZkbsAqVregDxEqDvhp3iLEfbpjnYXvOa8PymV8GJ7IaVzVJQkBSaGAvuNKOsbjByLOO3W+zMpJx0h83aSMzJhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0hG9JTpnqu1YkV9Y6kWepFv7xnwV6l2rjUPKWZ2/oQ=;
 b=r+qR+dSc0DBVp1btkudI3fHZb++o1OxK6gGyQhMCb48dIXFgE1EXRlq4KoQ20U+Ym0+qmKS6tO5Hqd8BiMnSNB3RBPShzDB8KFtnrHvZmVUv+YtSr4tbjh6uAYHhYrdNmE+31+r2SAYAKw+XDkkTiyyksxR78orRPY8kJlzipmIdxXNvl1mvVlI4K7Yez5jiwEQQBhBnxKfi9C5yBjO6lAK+ZAdWVVMjIU7pcfVm3ixa+tIF6Lp4TsRSf55gwDAxS46gxKClcaAC3ZA97+qYfeQaElJ4fc1kIil3kkwtdwkCg2bB+yxTn9Su15C3l+yyx1hCLp5A/mfmvzAMG+NpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0hG9JTpnqu1YkV9Y6kWepFv7xnwV6l2rjUPKWZ2/oQ=;
 b=LutWYMmQ6ZEStYqq8kCVnKXY0LHOu1C5O2WV8F4fTMkIApumIAXjHIhQLqbb0vRUhtvmjndcq+wBzBw976GeArv2+PGK7ci7BMn6yoEe8bAgGxYB6EN/WtvX2QRYs3JP1J/qZyq1kaIqiL6rNXtbn6effwSsoVoyn52jxOkYrJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:08:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:08:04 +0000
Message-ID: <a402a071-8306-490d-907c-3e9c3369c970@cherry.de>
Date: Fri, 28 Mar 2025 15:08:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 06/12] ref-manual/variables.rst: document the
 MESON_INSTALL_TAGS
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
 <20250325-release-note-5-2-updates-v2-6-19f050d61da3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250325-release-note-5-2-updates-v2-6-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 4059e73e-74e3-4382-1901-08dd6e01f50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVRNU0FZQnZlbm5uQUZSWDlONFl2M0JzSXZrVXg3QmVUbzNMWjE1RytoNXpt?=
 =?utf-8?B?VU9LQ1lEd09UTXhGZjd5TDRITjNKK2Y2VUJyOS83NUQxRk5zeXZYcmRoMGVQ?=
 =?utf-8?B?ZmlxOG1tNkF0amhjaWl2ZjNUcys0N3Jjc0ZJZGR3Uk80VlJCOEErZjRidm5Q?=
 =?utf-8?B?VDRzT3FZakM2QW9qY1M4cnRKdlkxT05GNFVMZTdWR1Y0K1BvZUl1Nng0ZHRk?=
 =?utf-8?B?Q2xCdTdyam1SWlIvZ0tnZm54Q2hNTC9lU1FFTXB4Rm54eXdEVnRPaDRkTEhY?=
 =?utf-8?B?SzFjOTFjYTFhYThuUi9hemIybzNzVDZ2V1VnWmFWUDBhY201c1BjNUZGNVVJ?=
 =?utf-8?B?SFlhQnlDS1RKQWNOSUErWWprWHVNd2lJbGFCTmZYOVFyY3VrUFR2TDFBd2JS?=
 =?utf-8?B?ZEo0SFE2bWJZSDIvWnl3S2NJWnFJZXBxWDZBd3ZyOXZBNUZGb2EvS0tvNHVJ?=
 =?utf-8?B?M2FWa3NIS2x4K1IvSFlIckFFL2hBZE9QOXhldEhZOFE3c2VvUUVlc0ZMNis4?=
 =?utf-8?B?RUlzNC94NzFNMGlFYTVLK21KaUdqNVpPQUgvUWR4WDc2dmpOeXVsSTB0Zk42?=
 =?utf-8?B?NzFnYkgzc3V4eTNTV1orTUtCM1ZxVHFaWjJMTE1DZEkxcWZnTlRNNW8xQXc0?=
 =?utf-8?B?RGJHTnFMMDhLV1dMQnNWTzdkbTRPclhoYUhqVXBhVmI5NVFWYzlGNFBUd2k2?=
 =?utf-8?B?VjFjSE1rOHZiS0RiOUxWRnNkMmRNNUFzL0l1NUh3S3dnMEV4K096QUt0NGN0?=
 =?utf-8?B?K2MzUzJPaHhyUU40bkpmaTZ1SjkzdEQ4WXBCTXBzaVh5Z1JBK2ZsQUpRd1dM?=
 =?utf-8?B?YVMxM3BwZ3Q1cmRqN0djVG5vbFF2NVpzdnpwM2NtVzZpejVqbkEvOHo3aEo4?=
 =?utf-8?B?YlZKZFZETFd1SjI5c1hvQkt6Mm9HeW9sbVdMMXVEYVk2bTV5YVdobjhDSVJm?=
 =?utf-8?B?eHo0Y3RGay9SWUl0N3plQklxSXY4VS9ERGZQZlJMMm1pQlphS1d6L29pNzJa?=
 =?utf-8?B?NS9xS09NUEk4Z3BOTXNZYjRaN3RYK0tsdUJTYVFOQm9tMWZMYWVHYy9vTm4y?=
 =?utf-8?B?WVJ4S1VnbURCUFAyNWptbnRiRGk2Um1xUGpYTDd4WXJna3JmOFJ5OUtUYWgv?=
 =?utf-8?B?b3V2c3BOd2sxaW03SUF0U2ZQZ2tJK2dVM3hhUGx6RUxPSjRCUzBheUI3TWE1?=
 =?utf-8?B?andlOS8yWE5Sc0piM01kRmRETXBIbDVEckgvSWppdnpKNkg1eU1abjlsMWk2?=
 =?utf-8?B?aXErbG9WMHVBR2FiUStpUlFDZTZPamduOUE0bklqYWRsTklVWGV6UEhiS0lB?=
 =?utf-8?B?ODkrbFhYWTRGVy9tVVh4TWNZTWNPUUxSYUJpMkVBakdaU1BVSEFQWlV0VCtV?=
 =?utf-8?B?OUZSMmJMRXdLSDAwbjNCVjlPTStqOS9PV2xxNHIvMmo4ZFl1NDJFbVFYRmZr?=
 =?utf-8?B?b2hmTEMydDM3NzRJVlZESit2Vm1USGJaRW5GUnhQRXZ4K05iNG1kRGRyalVh?=
 =?utf-8?B?U3dDVXJYTlVBdWZ6a2J6N1RxaG0vdmNuUmFIaHNxMFprSEl4MnpUcmZEQ2Yz?=
 =?utf-8?B?SDQwRkFnUzYra2NUdnBLcmRqc0dQc1Zva2c1dUszYXRjNnBCRG5PaGx4ZFFV?=
 =?utf-8?B?UElVQSs0NCtsd2NXM2VJZkdMZlRwWGdLd1h2TzJHV3I3VUdjaFZqOCsyMUxK?=
 =?utf-8?B?TU44aFYzbTVTV3pROEFURWJseWczSlNuajNnSlJPS24zMUk1aEt4NXZmUk1n?=
 =?utf-8?B?UC81Ris1VmUvZWV6bExmMDdxdDVPajcxR1B3SHo0MGpqa1lXTG5XMmloM1F6?=
 =?utf-8?B?TmZpT3BUcnZVWjhGMmp1UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vm8yekMxRDU5NlR6VU5CYzVhRFk2MTEwbGZCNldra1NTcWVJbk9EdEcvUnRl?=
 =?utf-8?B?YWJVd3FWcERLWmZMTzJpQkZ3OFIwTFl0VXU0eUVLVEs3RWY2QXZWUjVwQmZU?=
 =?utf-8?B?SERpSU1UVDJiNkpkVlh6ZEtLcEsyRmdlSkVWVFkzYlBrQkh0aWhORFZFR2Jp?=
 =?utf-8?B?VHQ1UnRRaVlKR2h4SW9kMjlEeDBvSi9GckEyR0t5REFBamVxVXZqQUJzVFpB?=
 =?utf-8?B?OGtSbE8wc2RybThXNnkraEFSQ3hYUzFQY3duK1MzYlR6NlRsbEM5dmMzYits?=
 =?utf-8?B?d2lYVGJ6dDNNVEJ4c3QzbVNKQW15VXZJRk5vR20wOENpUW55Q2NNcWxBUzUz?=
 =?utf-8?B?QTRFNHJpVlBvdVRCUVRDejc1S3FqVzIrU1RNeTRMcFBLM2VIY0VVUUtraDl1?=
 =?utf-8?B?WTJydTFwMGxvSU5ZbjZPWFFCRDFBNkNrZ0M0TWlucGRWdG1pcS9PcUg5MFc3?=
 =?utf-8?B?UHZhK05KTUtXZkY2WWhRNUNETERVVHgrZTdjN1RzVFBDQWJrMmF1YnZhZnRo?=
 =?utf-8?B?SnN2NU0vb3FJdGxvN1FMOW03MnJKSjRQKy82VFZsV3F3SjA1cFR2ME51WnpJ?=
 =?utf-8?B?Tit0NjI3VWlsWGg4UFhsQjBYQWpvK09BVnh2TTF6ME5IQnI2b09sWFh3c0xy?=
 =?utf-8?B?UjFzaXcrbDRKd0paRERsWGs1NTdnZUZEWWVXSytRdGV5bmZiWlJQV1lSS0NP?=
 =?utf-8?B?dWxiT0FBaWNuc3BXS1FTZi9SWERFODBxVWtKNlZUQ2twaHVRalRIY0R5WUhO?=
 =?utf-8?B?WVQwN2NuaFdBNG1xM01sdVZsUTU4WFZHNThuZjZOUmZmQncvOWxoNmg2cDRL?=
 =?utf-8?B?bTVDaEhqSGhZZzVaT0dnRnVWTElaVGo1cjIzT1Q5OUtxak1jSGhJajJmbjBV?=
 =?utf-8?B?QVV1SExsTTRwUnBCeit3alhCT2JWK1FENlN1WnNlNEtJQk1ROGM5eTY5Ymtr?=
 =?utf-8?B?anErWE5ubnYrbU5HUE5rZ0FoVERVaCtMcmg0ZjEzQjl6aHd3L2ZvcmcwTXhu?=
 =?utf-8?B?bElIc3A5eHdCWEQwRGQ0T0pGVEZzOXUwb2p4Mk5SV2dXaUhrZUxGbk92eWVB?=
 =?utf-8?B?cGlMUTBjdXFJRGNIVEg3M3E1OUFOZjh1aE5qS3RHMlo2U0xGeS9rR3lkeUh0?=
 =?utf-8?B?eUN5bjZqWjlPdXpqcGoyaXk2b3hsQkcrTklqSkVhY0t5TDNNOGdmSnV6MjFj?=
 =?utf-8?B?WEFvV3VGYVFsYXJiRTlhTk0zbi83dUFpRmd2N2hscEVHVytla09vWWpQWEZm?=
 =?utf-8?B?dkpEakZSUy9uY3ZSTDh3enJwNm41MnYvWmZySmROT3A0Y216eVM4bHloa1A0?=
 =?utf-8?B?a2E2aXIxTEZTbmJENE0rK0phanlFNmJhcUtJdWR0aFpxcnhYUDd5SUtRU3kw?=
 =?utf-8?B?TDB1MFdnSTNNcUowRGpVKzU1Vms0TXE3bEFRczdDYkRnWU5zdFZ4bUk0eTZ5?=
 =?utf-8?B?T0NBbGc4ZEM2TlY3Z001UTl3RWV4S0tGWnNXN2dMZUNoNlNMVWV0RjIxcGtB?=
 =?utf-8?B?VEg5UVhNQWxNOUpia1VPYmg3OTRIczdrOWtiWS9RMm1jUU5lTkZvMHY0UDNr?=
 =?utf-8?B?bnF0UGovdktDNmI4U0tTL3VoQnlDVFViUnJPQms4SDk4VzRVZUtQOFhBclY5?=
 =?utf-8?B?OTRpQnFUeGhOTVFLQjBOazcyUFJJZis4Wis3MkFSWWJ3OXFud3B1ZXg4alNy?=
 =?utf-8?B?MlZBbDJpN2d2enNvaUFFWVdPK0dGb0JyRGhkSmpWSWxIUjhBMklYWXlCOWhi?=
 =?utf-8?B?QTQ4Uk9CY2w1S1pubHc0MnpNalFXaGI0QmExR09YODVLMnlIeDFsUUw1TVZs?=
 =?utf-8?B?T05QcWtNOXN4VTJoN1pUT2huUlBMN29mTWhNaVZZODdKY1dyUmtZM0k5V1VT?=
 =?utf-8?B?TTJHaUd2cjRiTjZLNjl4YVdESEozam0rTmlaTTlieC9tdjVJblFxdWN1UzRW?=
 =?utf-8?B?dHUrUmdLSHRnVXdMYlczKzNaeDExYVBDWnRQNVBNclpZZDRhcWJjM0lWTVlx?=
 =?utf-8?B?RDFFRDdNWGt5RTBQZHRpVGs0QjF1Tmd5aXU1bGI5dHFPdnp4ckJFakF4TVE1?=
 =?utf-8?B?TkFVQVQ2MU96d1F3Si9MOHl4TkRiZndLUHgyL2xyWVc1NGV3Z0l1TFZEaXl3?=
 =?utf-8?B?MjRZRnpRQWlZQjY2ZGovcnQ1V0R6a3l4T0htZnNmMWVPbFU5WGd6SGFhRjBs?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4059e73e-74e3-4382-1901-08dd6e01f50f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:08:04.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsUs59oLnZbLxPLeIjOdnp+SZ27NcvYX5NvhgSsqQkstAHJZow8dYP5ChXOq7CWwo0wyWifDvp+NeJ1mUOcpTJg5Y/Ay33qBumryijv1jn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6673

Hi Antonin,

On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable can be used to add install tags to the 'meson install'
> command.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b872d7935..d5fec650c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5601,6 +5601,10 @@ system and gives an overview of their function and contents.
>         you to specify the inclusion of debugging symbols and the compiler
>         optimizations (none, performance or size).
>   
> +   :term:`MESON_INSTALL_TAGS`
> +      A variable for the :ref:`ref-classes-meson` class, allowing to specify
> +      install tags (``--tags`` argument of the ``meson install`` command).
> +

We could provide a link here too, e.g. 
https://mesonbuild.com/Installing.html#installation-tags

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6821DC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:37:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web11.41853.1736851063458787636
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 02:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AELJT8KE;
 spf=pass (domain: cherry.de, ip: 40.107.20.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR6YVAAEcjjkJXSgQMwpsEEv6UxSJrM0FNccWyUTECXUk9ff//wxYEEVHmNQLv+8IeIhg89yXn0Lw+BzAajg5dTo5tMF5beSTOKV11Sbx0v6JLOOQu5dNNmvfCdGBoJz2BM/Ezy+NfXJXK8RIj6QZ9UJGSSalr0IPZ9Jo7LizPcs7WkyEgmP7453enzB7A9SfpR36Wt6KTDhXVPsv3tgpAFCkukb8X2WSInTBlVcSu8VzEqIVsxyFAZcKdDU/r/iUfHsuE3G1xdAL6NF7LYJLKp5yalX8VXom24yNMiM+YC6rAwWngxj8ksNAG2Z9CJ35zyVvNlb1nXWuscQBkH5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZJvGH3LAwlVHvo74sPA9WbMScURYdJzLmwxp8zAUTc=;
 b=DEVl24XCotOrgZQ2+4563wPz2M3+sQkciMnUMizUVNgEffz0W95DWtaCH3SL55wApWgMGV8yuUIg3ipRhkldLR/FbVn4jUzb0CK8sHRScYoIpf9eOOVVjss1Kc3e+9bEK/ClvNRATObz/ZFpX6XYN/EQ4hqwqzptHlw85/1kcEp0GCxN7xc4aaPv2W0+s4hozW2GgUFZI6Ix83sKbrGEB6zDDrWIcDMTOWuMrUgecHTUnTlv8SmLcyMSsOwwYI3J9XlwI7RB8RI92yvRPvtiVkJNAFOW371cPE7CeFAEjzzSmFB/NkG4w1Pf2+Ig9nbHTLUE59jupJyZy/2OIuxDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZJvGH3LAwlVHvo74sPA9WbMScURYdJzLmwxp8zAUTc=;
 b=AELJT8KEA33eJy/xcGD8DI2DEe4HsTImOx3+wxtKVLYoLh0VfgOyUMd5YwddXQhU8F3ACTx+gTHTxHDHqjMGOIcUXeofUlp611bvQ0m7HLPp3bpnhDSaXGCPVIhW7iRLyk7ORKLpKco5GNV7slbN9tLDcxr0/88l9AZS8FpfUuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9377.eurprd04.prod.outlook.com (2603:10a6:10:36b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:37:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 10:37:40 +0000
Message-ID: <52150661-771d-43d8-bf91-edb4f2a2d8bc@cherry.de>
Date: Tue, 14 Jan 2025 11:37:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 07/14] ref-manual/classes: document the
 cython class
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
 <20241220-release-note-5-2-updates-v2-7-df29527f3fc5@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241220-release-note-5-2-updates-v2-7-df29527f3fc5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 2913a15c-a37a-4791-d04e-08dd34877840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHRYbVpWNExrS0FEWjNFeFNnTTFwV3paYlk0YTFWZGJ4SmhVWGl2a1Y3QVRD?=
 =?utf-8?B?ZEpRR0lieGVJM3A0MEIzbUkxTkRocU5FNzlrV2JiODUxdFdJQWFiSmsybWFZ?=
 =?utf-8?B?U0hMaXhpckx1NTh2NmtBVVRKUjY4enRoTVBVbTZzQXdNU2pwU3pyNnNoR01t?=
 =?utf-8?B?N0IvZHZJc3hPVjNJY2dYdHRJWjIyMlIwNHFETnZxQm9KZ0pSbnVyM2IvNTcw?=
 =?utf-8?B?STM5eVVER1NIdTNGTHhtTU9iV0lSR1pBbUQwLzZOcXNISDFzNnRpaW4wcUVZ?=
 =?utf-8?B?dGpaVjNVcngyK0xlakw3S3FQRmt5b25NcnhXWWJRUlF0eTVKclBjUjFwQ3Bp?=
 =?utf-8?B?Lzd4TkhIN2FpcWZRb1hodDFYRytXK2tiMmI0TVk4bEVhMDZqQzJtWWJTODBv?=
 =?utf-8?B?RVFpYVRTbmpwYmFzdnIxVVFVM3Jya0tKWDR4Nk5xTGpoWWRxQXc3L1JTV2tB?=
 =?utf-8?B?Q0NkYVQzeE0yZVBVN0tjMis0ZGQ0eGxmY0VDS2REQjhDSVZpMmJNQlV0MnlX?=
 =?utf-8?B?SlVWN29ZdGZJb0k0c2g2b3BqeEozN3M4UmZKbWZCaE9VMEFaVnBZMytDV3JD?=
 =?utf-8?B?bmFBdWppSFVLTWIwaFZNQ0xQaTlNbWNTdklqYWdjcnV5M1JOd1JRKzhYaFBJ?=
 =?utf-8?B?bWN5aTFST3Nad1BpUGlpSUhkeDAxN1dZMUN2K3NhYjRXMGRsSngrbGR4di9W?=
 =?utf-8?B?eFZDYS96dGM0UjhUSGNRQkFjeTd2OExYSkRvOXZyYkhBY2wzSVo5VERGazFB?=
 =?utf-8?B?UFNHenNXMGJsWkpOYktadEpheFhjVnhYQmpSQU5nOVJKYnNOUTFDbXhWUkVV?=
 =?utf-8?B?RWxUZzFMci8rcHZROE5ad1dhL1VvR1V1M3BvTS8vMS9tcWwvcmtMaGdGMmNQ?=
 =?utf-8?B?dG5NSHBDT3M4Y0JIVC8vbVAwT0RicW5qeVp5Um5WZi90TTdRWnp2RlNBMlpt?=
 =?utf-8?B?M2UrY1oxbW1XWFQ2bmpRY050RytUdWhvSFUvWkpJRG9OQTJmOFN6K2grVS9N?=
 =?utf-8?B?eVdXR1NaR2ZnYk51UVFKOXI5SXFMVmFUMU9wajVIVitmMzJTcy9BMFRDSC95?=
 =?utf-8?B?R3VoTzZrOXg0UGNjbjVEeDNZak5ncUF2L3lkclVBWFlnNk9vVmJTQjAraWFB?=
 =?utf-8?B?aW40Zk51VEsxVzllVGZXMDIrVXRJbzFMaXFlZGVWaEdlUFNTV2V4N2kzUXZj?=
 =?utf-8?B?MnBML1A2ZVNjSW1NWXZSMTR6Y3VYUDVkMEFJSTF2U0xHbDFGMXNISVFOOEhY?=
 =?utf-8?B?NXpBcVNXcTQzazcyTGlhNHFTa0dmK296Z2pqVVhpUll4WGxWR0w3NCtPZHB3?=
 =?utf-8?B?UlRTOW9VT3VhRWlmSTBhSE5kUUxQVjlORWtGSitpR2dZVUxGU0gxcFdEZkFP?=
 =?utf-8?B?bG9UQ21sRERMSHUrckU2WFFRNXpuT1Q2WHdMa1pvaWFRY1VFdXYzdGE1SkNq?=
 =?utf-8?B?Y2xxRzZkejcvblZaRkZNMWxRbko1SWQzcHpsT2dmZ0N1WHc2TDhYRE9iY0lL?=
 =?utf-8?B?eFNlcGYyd3EvMzhsbFdLb2FuMkQxaTdUaktoVFZDVFAza1I5OTY1cTc0WEdD?=
 =?utf-8?B?aitDVWc1Zk8vMFR0UkxPekluNkNKZ25PeEVyWXJOaXZEdEg2K1JBQTNneWJl?=
 =?utf-8?B?V3p3MFhSUmthOTBYQ09CL2xCZlo4QUxnTXNhZFF0TWRvQ1pQTDF2cjQ3aW03?=
 =?utf-8?B?T3Uxbis1WldlVjRjQUNQVUUvM2c0b3FpZGQ0bHNMVUlPL2Q1WWRaQVMvTkhG?=
 =?utf-8?B?eDVITmVxRGcrcUw0UDlXeVBjOW9IamNQNXFoQlRpRHpjU0g2TVJWMWhuVGRZ?=
 =?utf-8?B?UjRCeUErQ25SalRnMThxdnBEOWkxVEhpZmkwMmxWcnRjeHQ3a2VyT0tGVFRo?=
 =?utf-8?Q?V1KndI6gY4fi3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWpUZmJWcWgvRERWa1pMSFRYODk5bjFRNTA5TWY1M3pBOW5ycm1nOEVqV2RR?=
 =?utf-8?B?bEFROGhsM2RuKzFSWk5KRmdNTUZSNTRuS1I0Q1lobmY3UDhUUmJVU0w1MzZt?=
 =?utf-8?B?a3gwRUcyL2lCd2JKeHM5WkE4Y3VzZUxCaHdvVVV5NlFGanZTVXlTdUlXcHZP?=
 =?utf-8?B?NGcrdlN0TTRPZDdtR2FxREJiWmpoTDBNejNRbDFjVW5TNUhGaEczWVAzaW45?=
 =?utf-8?B?b1VOTDkvUWdQanJKQTV6bU5pb215cytaVVVFRjZSQ2VETGFFY2tFK1JDZmZQ?=
 =?utf-8?B?bTFibWlqVmxWSVdYb3dzQlJTMTBkTTdMTGI0djNzNWdsTzI2dEJWQlovTWFz?=
 =?utf-8?B?TTBpZndVblU3VzZLT2Z5ZmltWTFiZlQwNy9nRXZ3RzBpZmFJV3ZpcjBSNEFV?=
 =?utf-8?B?UVFJQTZtN2hyWDVsaC9vZmR1VE1BRyt1Wmg1bEEzdVhJcnBjdjg0Q1RiUDZm?=
 =?utf-8?B?aFlTVDdPOW05UW1hWWN5SW9PeHVIUEpqREVyOUdlUVhPa0JMTG1kSWtVclUv?=
 =?utf-8?B?Tm8vMUxzWGN4dGtDRU5iUTRxNmc5eTNDVjkwaDlLZ3VmWEJ4a3ErZjRRMXNK?=
 =?utf-8?B?VS94M3UzcXJLQXJRYzIva0tWckRRQ29OcUFVKy9IdmMvenBJQWdKYzZESU1F?=
 =?utf-8?B?c1NvR3BxK2FuZENDUGtydWFKL01RNzBCRGtpS055UE1xcFNENnhrNHM4SGQ5?=
 =?utf-8?B?aHV4blROTjJsR3FJRVJ1Z09QWXJEbTBadUE3Njd5NitEeTNRczZUdmpUOTI1?=
 =?utf-8?B?d3hTMi83cWRrWUltRFkyNzFsWUh4QzBSNHhNYWE0SmxMTmMvc1hQSTRNSmpH?=
 =?utf-8?B?MGVBN2xXRkZ1UGxsYmJZVGVjMzdpNmExL05FYmtuck13cmIyNUJSNnkwVEFz?=
 =?utf-8?B?dldWZHBkcTRzV3VWMkxmbC9RaTlPMDA4UFFsK05vRkphcU9Td3ZoMjhMbEky?=
 =?utf-8?B?NVhyd0orQk41L21uTTBIOW1NcnFGdDJyZmhNcjFwKzY1REpoSUpnQm9yMjI3?=
 =?utf-8?B?Znhka1lteUQzdnJ6VzRPdHQrU2xqU2p1ZFlyWHpEbEsrVzFFalc3SU5WV3pz?=
 =?utf-8?B?dWlyNUtvcnh4VlRWem5XVVhjaW1DY2hZdGQ0bzIvK2xDd0pGbDdoL2Naeksr?=
 =?utf-8?B?N0JDM2dPSE9lK05GcDhLVmkzUXA5L1B1bWtTSUtxUndzaG1iZVZXU2IrV3pC?=
 =?utf-8?B?YWgyaHczRlZwS0VMNjJtYVlURVZ1WXVpL290RVRVUFVEa25KajdEUWh2VWk0?=
 =?utf-8?B?Y2xQS1ZIK1hyNFpvdlFJa0duUjJ5cXlGc2g1T3lkQmdubEFLYW9hdDBsYkp3?=
 =?utf-8?B?eS9HdkV1VWs3VTIrbGFGci9IRnBFVXRvckVnZlIyTWMzMjZzZ1d3bm4zL2hP?=
 =?utf-8?B?K2lWZ2h6Rms0VUVFMDkyTmRram8yWUo5NDlCZkJuSlVURktmaStzU2doQkJP?=
 =?utf-8?B?OTdGOW5jOWhUQS9nUUVBanVVYWc4RVJlVTY5NHpZclJrdGtpMCtYUzk1UUpS?=
 =?utf-8?B?bEw2dkdncm5QTHB5Yjd1NVNrUGJNSmFPS3VBYVloZlJuQjVqQUkwekxIRTI4?=
 =?utf-8?B?dnh2d3V2SVVBUlpYY24wNnZNWDA4K1BqV21OUWliaTdWWFltaDF4enE1OUVZ?=
 =?utf-8?B?SzdlT2pvVXZKamFRSmJCSUYrT3BTd3NLOXJyd3h0c3ZIbGYybVZGUUUxZGEw?=
 =?utf-8?B?bVE3MWpTNW5qbnNGVXM1V1gwSVJqTzdUOUc4NkxyMDVVRjBpbnpielNERUdV?=
 =?utf-8?B?UkpMZkE3UU5YMTY0ay9ZUWR3Y2hZWWtXR1VoMEo0cFRyNG14ajR4V0o4VXFX?=
 =?utf-8?B?dU43QWNyaVprenloclY1OGdzaUwyM0s0SWJoZW93VVQzMU9HMlJ5cnZTd0JK?=
 =?utf-8?B?QUNzMnowVzlOLzk1QUpHbmQ3M0xNckgvVjRidG9BSDZYa1NOZlBaMkUxb0lD?=
 =?utf-8?B?dTZnS2xQQnMvR0xjS20zbngvaWJsV2tZUjhHcG5CWlVzbU03dTNnZUFnWnpI?=
 =?utf-8?B?NHJqT0FKbCt4THNxRDZldlRnMXkzZlNaMUwzZnpOMWVpMWw2QnAvQlY1eU1S?=
 =?utf-8?B?bnpiNWpzOTg1aDZDQVFTRm9JcFdQeWFJbjFKOUhkT21Cc1g4eGszaGxoZVZL?=
 =?utf-8?B?Q2F6UzFsN25rSWd5TmthaEdoWEpvZFJYc2ptYklKeVoxMHVzSnJuVkV0bVR0?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2913a15c-a37a-4791-d04e-08dd34877840
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:37:40.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bN6jxPDeVwLUGSnE8xYbR9U3lGNSs15VUEZlENOjg+J+yMilnT8pO+SCc3OeAfOZ9FxlSV7RreY9SdIdVj7F9AGEjbcD8n7z29/ZH7V4H8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 10:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6104

Hi Antonin,

On 12/20/24 1:16 PM, Antonin Godard wrote:
> Small class added in oecore by commit
> 64b6e8580842949be58f97f4dff91d1f097c4020 ("classes-recipe: add cython
> class").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

For your information, I have an alias to only keep the 12 first digits 
of a commit (which is what's used in the Linux kernel for the Fixes: tag).

alias gitf="git --no-pager log --abbrev=12 -1 --pretty='%h (\"%s\")'"

You then simply call gitf 64b6e8580842949be58f97f4dff91d1f097c4020 and 
you'd get
64b6e8580842 ("classes-recipe: add cython class")

This also highlights that this commit is not in OE-Core but in Poky :) 
(they do not have the same commit id).

Cheers,
Quentin


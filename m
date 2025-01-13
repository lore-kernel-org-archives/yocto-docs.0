Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AE3C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 17:05:47 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.49])
 by mx.groups.io with SMTP id smtpd.web11.22823.1736787941351317298
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 09:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=P/D7NbMJ;
 spf=pass (domain: cherry.de, ip: 40.107.105.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrYzADnaA6icRzuMu1EW8gbGh2v/EJ3ZrX1IDc557CgUllBjYSQE6epjuU32ttD4tiFqe8WJjEdDtMWZq+NlNXy1pBBBVMyncxTK55HxhxaV8wJqWht/+l1e6la/Fx4DYX+0zzhW0Y6zvRqsQeWpbI0fHqP5yBPouu9dSJTewvSw68kEWBtCSV49PFaXzO7bILpiEsX6HrFWRPobunH0D9tpGS7JS0aXrfjeUYlVRGaQL3e/lAQ+Dtt9GHGgu7CWsOiA7PgnPpwmDfEddNHV538MuRf4Y0QPX8KvaDzTSDYezzLlkRSK5/AX5jjLZv/BC7LAQCvuWW9pi+E4Sc0lLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBvmtWtgcN2v3iaP1BWld8t7YzvCN9YtHeIz7bWn/AI=;
 b=ZYA9t5CIJiQInIANnCshBsIZOggViiard1nMpcm6BI3wyR0edSCXhE9KG9nk6iJZ9DghLs3rfHzcX6vcvyHF8sAanOttXhZXo8vSJr4teDjQ2gS80D3UC8EartEDDWepyuB8AV88cVfA0r5N6djg7plI04Rr+xW8we7u4cR9VXUZmS4lpcLou3k2PYsEUYKr8CPnS1Tzrpsu2cASt/M+UF9pZTSNZw57fzShcUDyNz7/GGnC1NrUPgSuG7lLBJ03Xs1IzU89VEe1kgBrFVGhqA2Dewb1rbdtwSRiyD6OJngk7nG48nL18XPkKzatoXtpRDCKVK4g2aDa5ZcTpxXwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBvmtWtgcN2v3iaP1BWld8t7YzvCN9YtHeIz7bWn/AI=;
 b=P/D7NbMJUKc8QwPpCGekEG6Hgmp92LRmFViP+V7MMb7uBCdmQFifcRuv8Y6shkuEbazuxxHYUJtgsHX/e0Y+BVgZZmezFHObTrUHhj+6oKOdLa9dzkBvunSdOXVzEcJ3OnPIZMljD48VyLqgRtt77cLg6RSF/cyLk13v8xw3/C0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8400.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 17:05:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 17:05:37 +0000
Message-ID: <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de>
Date: Mon, 13 Jan 2025 18:05:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Update autobuilder URLs to valkyrie
To: mhalstead@linuxfoundation.org, antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
 <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f424b44-93ad-4630-a05d-08dd33f4806a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUpEY0J5ZmVrYzVGQlhvOWdlKzBPUG5DS05vTmRTb2IwNS9qeVJadmdDY0NT?=
 =?utf-8?B?d3pudjhITGFwVEQwVWIyQUFPaEFIRlRxc0k0WU15Zzh4ZjlyS200RzBaRXlI?=
 =?utf-8?B?OWFmdjlJS3YwUjBsLzlRbXE3NkR1V1plZm8xeUFkUVFOT1NVTmZzMkhxSkVj?=
 =?utf-8?B?ellMcVVNSEdRcDc2NzQ1cUlxY0RkcWlxTStHM2pkeXF0UU85NkpxVUtaZldv?=
 =?utf-8?B?d1JoOStERExrQytNcS9TTnJISlU5UmxYdDA1eUVBZXk0a1VkRnBCK3FTM0hl?=
 =?utf-8?B?UEpNOFZVMHZEclh6bHE1MmxnVERaZnVOUWJMbGlLNWFDL2VicXhRR2QyM3o3?=
 =?utf-8?B?SHpNd2pUVlhiZjZkdGNseGlNbWtLWm9BemlnSXd5TGxzdkd2NUREaWVBbHQ2?=
 =?utf-8?B?T0djVkpXQzlYdlRUQzNWTzk2bVFZeXJMVFZGWTNKbTAwQWFId2h6ZzVncVVy?=
 =?utf-8?B?V2ZLd25SczlieE1JZTIxT2JFYU4vZTl2elc2MFNEYnR0VUVrcGsxMXNMOHN2?=
 =?utf-8?B?UENFckg1dE5iZmJiNXo4WW1Wd2Y3YUZNY0VIMmhkc05oWDZpUmFlc3dZMTdp?=
 =?utf-8?B?bGZaZmNmR0NzaHdheEtSS0kzcmNIUHRHc0JSOGxuWitXWHN1emVoYkNaUExW?=
 =?utf-8?B?dVFuMXZibEZCYzZUU25JZnVkbEZUWDk1MldBVytaYk9Da2VJUDFqekIvSTVz?=
 =?utf-8?B?d3c1MDlCVjFrTHFzR2FHblg1NGRaNTA4TUlMSzdTS1NrRlJGUUZUNEpFQUVv?=
 =?utf-8?B?bURXa3NCL3dyTjlHTnkzRE1jRzQwdmJaakdLbk5CQnhVQVFpMnBpaVAweEc3?=
 =?utf-8?B?OUJlUG1DemtXYkVzb1lNVXk0M0syaWNSRTIycS9ZdHpydEV0NHppdWZsWmhU?=
 =?utf-8?B?WFFWd2U4UmVBSmVvWmdSZUVGQ3RsMjR6TktBNC9BKzc4K3l3bTNTSFlHcWk2?=
 =?utf-8?B?c3pQQU9LdE9wOXdxOWY0WnVaaWN0R2FNeWcyamZvU1RhRXRvVjVaSEo4bWVq?=
 =?utf-8?B?VTQreThrdXNiWFNVQmRwMTVBckZ1c3NiV09OcXVaSjlpVFR6aXdpMmxFakIv?=
 =?utf-8?B?REZ4cU1VaGFMWmZiT0FSbkxVNmlMTXVpL0l1OEtVbmwzV05lS2JjK2tIZE5h?=
 =?utf-8?B?aTNhNDNjbDJWK1gxTDJzWUNIR1pNS1N0YXN1ZmswNVZ2akVnbTAzUUpQTm1K?=
 =?utf-8?B?blJqbmtLb1BXc0dHRUxGOVBaT1ZWQi9DTVZMT3llQUdiNjBQcUtGZEZ3b2Ni?=
 =?utf-8?B?QzRGcUpTcmd6YVBuM2lPY0QyMHUxTXI4czAwQjRORnBBNk5hWlYrM0h5eXIw?=
 =?utf-8?B?U0xpZnhFcDd4VUJNLzJiYkdYZlRuL0hyMlQrVjBsV0U0MW44cm51TmVpNnJq?=
 =?utf-8?B?SEduSW9uVWowbU5uQUZvNUFoMStzMlRFaHZwU2p1b1JHR0p1ZCsxWXkyK3Zt?=
 =?utf-8?B?NDV3aTZXWS9yL1FBWVpFcU5DME5VMmNKQUtjUnpFRUtRbzNBeVE0N3hKWXlK?=
 =?utf-8?B?bFlodHc0N2JScnVDbXBNN0ZMWWdGaTNndHpGUjkwWCtHZUlEUURZRzdCMUV4?=
 =?utf-8?B?dGFLcTVpUTBZQjNHV3F1NnRKL3NaRkpsV1A4Y3J6Y1VVR1YvL09PYU9GUzhD?=
 =?utf-8?B?VXhlOU1ya005WjJHWDhSdVRBcFBqYkN0a2xOMWZOS3RKdTdoZ2ZORStiMjJZ?=
 =?utf-8?B?VUh1RTdIT3lQdjJJT3IxVmtJSTM2STJUVWNkTmdTVyt4cGZFeXppWEVLMXhU?=
 =?utf-8?Q?Tv3vD7QqKg6penDGvpl1dZmUqcorG0y9QDuwRa0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3R3bUN5M1JiVkN4S3dTTHZWaG1PS2dDZ1JqQmxIbFo1VjFkMTQ3NkxhQzlG?=
 =?utf-8?B?ckx1cERPcUpTbnEvUEt3OHVWaWEyTDI3dTh3MTdGNVVmY1RQV09OcVhZRHVH?=
 =?utf-8?B?NjlNOUhsSGF4QS9vQWxlQkROSTF3Y0o3MFQyekk5Z20zUUdSbnA0QmV0cTF6?=
 =?utf-8?B?bHNZS1dSQmluc1JqL1g0Sm5DS2lnVkRuVGNLMjQ2blM2azZ4MmQyODBsdm5P?=
 =?utf-8?B?VXdLTDFPUEhOQU52SHFxb2hQaUJHQ21NR0J5MFZFRm03cVZ6aUZxVkVWUDh0?=
 =?utf-8?B?V1lNR0dyTjJnZnZXUzdtekRObTZoTlZuNCtGT1ZaWVhsaTNMb0NNRDNYVHVW?=
 =?utf-8?B?OFZUNXFiRVlzdzBnWjB0NmVkeEZFaG1tTHhjS2hSRU1pQktmQUNmR21qNU1w?=
 =?utf-8?B?emUvdUcrMkZudDlrVmV3RUgxVHJPTFRQdEdJZWVwNzdCWXNPY3paVHpqa01M?=
 =?utf-8?B?K2JNMElIWVRyZHRCbnJobXRZUGp2MXVPL2JmQ2cxdFR4MGNjYnVyZk5aOUlh?=
 =?utf-8?B?TDlkL28xaDlpTlE0OENkTktpeUVWM04zTHgvc05VVlpNbGp4MmtGaFgxSXhZ?=
 =?utf-8?B?UHJvVFFjcjRSNFljaUF6K3dDU0NaR1FOTExxWjNiZVJFQ2hLYTQ0YytkVTB3?=
 =?utf-8?B?dXJYYWh2ZEFYR3ZUeUdBQWMweVlMN29xeCtPTWFQMnZkbnQzb1k3Q0cwN0ZQ?=
 =?utf-8?B?eFBBQTdRNXFXUjhZakE3aFZ6K0hCUGo4TUZ0MTRJZGx1TE5JR210Nkk2OUIr?=
 =?utf-8?B?aXRMYkJrdHp3M2x5a0pjVDBoVDM1M0szMk1zaGJvV1RyYzhNMTlNNUVJZ3l1?=
 =?utf-8?B?YysxWlh1KzJSS2xnVWpmK1NLQVpQcThQbmxVMW5QUzljc05McGViV3RQUGJQ?=
 =?utf-8?B?djh4OEVTZ05hdEh4NlY5N2RsUGtyam4yendtVW9DcW1xQWFnQnVMcnpIek5O?=
 =?utf-8?B?SEtwMUE3MTlYUlRjOHhuRWlUZFoxWnFoWERWd1RuNlQ5djlHTkVlbVhRYm8x?=
 =?utf-8?B?bVRBQUNKbzhLTlNYNW1UbHNKSGRsRENoUnQ1bmJOci8rYkc4aU5kajJiTkhS?=
 =?utf-8?B?TmhZNWhlOXVlMXhXdmg3QThsVitoYWE0UUcvN2t0TVpIUWY2S3pUbzJlVHdx?=
 =?utf-8?B?aGRZbm1keW5WRnh4UHBsWWJsTk0wWFJOVTY4UTg2OGtNanYzNEdnVTAreVh0?=
 =?utf-8?B?M2RKSkZ6U3EzUm1hVEVyYVFuWExka1ViRWFkR20xcGlZVGkzd2ppc2JWVXBX?=
 =?utf-8?B?VHlUbm1rYmpTWlRwQ1BuQ09RSkt1YWhjK0w5YlpqU2wwNVdYZXBOTjgxZFhG?=
 =?utf-8?B?N01pSDBtcENxNy9scTV1ZmpoMDVkb2lZbXlDNlRId0hHM09OamJmdGtucFpG?=
 =?utf-8?B?RktBK1pTWDYra1pEOVRrbW9rVzFEVnZseGhoNUZQd1U4VGtHMjdVRHdkQ3ls?=
 =?utf-8?B?MktJOTVpS1VwK2NjQm10d0JsWmRQMjVoaHEwcVFmY0RHZWFzNmpkZmlyRVRI?=
 =?utf-8?B?QVBmNnpzOUNiOExxNnZkRVpZenVDRnhVNUwxMmdWdDY5VFVDVW8zbHFRZjJW?=
 =?utf-8?B?blB1eFBQYTRaOWRkNUMyUEJ2aWpqc2grSk90ajlpb0Uyb2Fyc0NzVFF2Y09S?=
 =?utf-8?B?ejE2dW1qMWdxL0l6aTRVZGNFa2theklnVFpxd2VtTjByb25mUUJJdDRld2Vr?=
 =?utf-8?B?Z3FZY1Fpak1VcUNXa1lkaWhEeENxdkZ3RDEwTjNyakdraklJRW1PbDk4QWh0?=
 =?utf-8?B?VzJsMGFOYzVES2RmR045ZjZMeVV4UGlCV3ZWUUhkMHVKWnpER1RPY01IVWhF?=
 =?utf-8?B?Z1JWN0RibXVhSGFERDJqdlErM0FZTDlmdGhqQ3o5VDA2ZFI1S0VHWitxSFRt?=
 =?utf-8?B?SGlZL29TM1c1T05MVFdWM0tHVWdYTENWNjdrQ3J3dzd4RmM5YWJjQmtqb29j?=
 =?utf-8?B?Lytkb3QvS2ZjbkVDM2ZocWlueW50T3dsczdhMTlCMmw3dmNHVlZpY1lxUlNH?=
 =?utf-8?B?UmxJSEZHMmY1ZGRIYjJkbjh5TFdza1pjdk4vSCt2N2o5ZDlSODdVTnNCSUlW?=
 =?utf-8?B?OG4rb25vRzRGVWYvVFhLYUg5ZVJVR0NtUmFEYU9IQll2T1pxRUpJb3Jpc2RO?=
 =?utf-8?B?Z3hnVjA0MGdBWDdOcUUyZndQNVZNdHI4d1NKVkpzQ080VFVsL3F1VG1hZllG?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f424b44-93ad-4630-a05d-08dd33f4806a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:05:37.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDbie/32rQzPX0XlUYrk+g0Vwl5AXoEOuWvsEe3rUA8PzHzN1RoCgN7zbncv1hr/bVWQ30BsurgcDhd7OHf6pIOU1DCKVko7WzVzCPHF0YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8400
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 17:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6090

Hi Michael, Antonin,

On 12/28/24 9:45 PM, Michael Halstead via lists.yoctoproject.org wrote:
> Looking over this patch I think it would be better to move the typhoon
> archive and valkyrie onto the same server.
> 
> 
>     - https://autobuilder.yoctoproject.org/typhoon/#/
>     - https://autobuilder.yoctoproject.org/valkryie/#/
> 
> 
> I will redirect from valkyrie.yoctoproject.org to
> https://autobuilder.yoctoproject.org/valkryie/#/
> 

This redirects to https://autobuilder.yoctoproject.org/typhoon/valkryie/#/

[...]

>> --  CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
>> --  Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
>> --  Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
>> --  Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
>> +-  CentOS: :yocto_ab:`/#/builders/reproducible-centos`
>> +-  Debian: :yocto_ab:`/#/builders/reproducible-debian`
>> +-  Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
>> +-  Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
>>

Am I supposed to see anything at 
https://valkyrie.yoctoproject.org/#/builders/reproducible-debian? I only 
have None in all Build requests, Build times, Success Rate... Same for 
all other builders.

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E85CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 09:56:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.web10.39585.1760349376274199412
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 02:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GuZ5VCDm;
 spf=pass (domain: cherry.de, ip: 40.107.159.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFfumuO5D4ndrLMNNMGeao8M1Y3Kpl74HRe26XT/NsTSeYVHWRiN3UBR9XNaqsmsoVEf6iJtp/mZ8cg7D5owBGUvKjUJUmUZkEvLAcRm1bkEnF6PjK1zTYqZg+eXM4iTI1EkVhGw1SBC0c8zCFTqPOCEk1qtHvODq6zfD0fsKbdZ10NoVu2qcIV8WAYOJ3WUX84OeABO3ugYlSW0IezXXoabE2mTRGtLQqiKoz2MTzh63RxiA4oqZ/qYitxO0l11nwcRQRhSRNPhVRfyMmb+nwCx1O6qGxo3h4h915wVacLmTx2r7Dd2OR3FO3eIanN4YibmkjmCbWdgFd4534Yy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuihYJhc6q2DPTEPTT7oeZShsIgW9qqfwcZBfwYOqH8=;
 b=D0PYQycUtPNVqroZG/pafUfiDhNkhcFxLlAredQHzFnBXSp+4VnJF71ipio9z/+gdUzjzUiMdcDYaWEUCTTZprq30Nt95CQhQPdT0SpC8Tit/7gpeCO5Xc87eiNDgjk22Y5ckJ3dVIB3DcUkBNHbUEIb0WqOtPoJP/EhHQ8CO4L+3U+dz8USl/uxNDOoV8wH32THTqcSd/0cHhxXPCdkfsy1lynfPhgPjfm0rmRvZckPOqena2ur/GehEyoXWusw6P37JBxXAKFwWqyRcAM8nQD7egux4UAPv4V35BD+n+98sm2lp9+mEFE/k2KBLY8L0Hi5sNie26+Vt4ZJVsWiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuihYJhc6q2DPTEPTT7oeZShsIgW9qqfwcZBfwYOqH8=;
 b=GuZ5VCDmXlzb9oXn4Q/69wVtgIMsH7zk4sWDnjEMnefhTWdQW4twXhtzwrX3u3EEJyKasLaiVtK12Wr594XjNym9BMbwlzfbJ5zr2AaUPaJJ30WjEA5Rsixe8Isawt5wDBzxSuOA3cSiMukdGm9jTNEqVLowRbn36EZTR4fFCgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 09:56:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:56:13 +0000
Message-ID: <38df446c-718b-41c9-a0df-95e5dd515371@cherry.de>
Date: Mon, 13 Oct 2025 11:56:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] tools/build-docs-container: use CONTAINERCMD to
 append args
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251013-fix-build-docs-container-args-v2-1-9ac0fd56bc65@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251013-fix-build-docs-container-args-v2-1-9ac0fd56bc65@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b073f8f-24eb-4ecd-213b-08de0a3ebe28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eGZORWQ4S21GSGl3VWh6TE13MExNSTc1Tjlia2ZZSFh0UHZqdnZ2Q0pENFpk?=
 =?utf-8?B?enF2NUpXc3JEUUpseGNzQlQ2U3RwbXZCZXNhWUtwVFE3TEdPcklLOXl5WldU?=
 =?utf-8?B?VWd4eVBxVDhpWG1zRWYrSE56VGFLb2x5S2svK3JpYWtjNVhlTk54QytTN0Zs?=
 =?utf-8?B?dWdkUGVHV1dWZjZHbEdYZi8xSzBXU0hxcldFWGhSMDlwVTJGMHpsMTFlMERn?=
 =?utf-8?B?aldJMmZwd3NYUWtLRUhQZnhrT3pjT2RSSjk2L2tYdFYwQVpRaVBQVTZURTV5?=
 =?utf-8?B?dlNDRXQrQVJza0N2OC9tc2dDZ0FRR0RZZSs5RXY2cHNyV3VkYlhYanJwNHVO?=
 =?utf-8?B?RVNsd3pLWTJ6Q2VPQ1ZaYWhHVndnS29lem5IeDZRU2IzR3ZQamJIYkthelBL?=
 =?utf-8?B?UHRWTk1tOWpvRmRDVXppcUZJYWViQnJ4L3BkeUtrV0ZyVU0vR1NlZ0hjTVBt?=
 =?utf-8?B?djBINlkraXZTdkpWYUp6WkkrTkJzU3Q5RkFkTjdkQWZyUVNYelhmT3hXYTk0?=
 =?utf-8?B?ZlRMajh5K0Z4QTdGb3o2bDVNTnZwa0xpNlRwNGcxdjhZOG5aVlRXeHdlWGpD?=
 =?utf-8?B?UHhoNUJEeDhHTlRkWUlxdXJEVVhZbThwZCtjWkZkdnZlSG4zaHhVbGVhT1F2?=
 =?utf-8?B?TFhmTFFMZXNIOGszdzhqMzE2bTFtL1lKaHVKLzhKTXd0N1JRZHdoQTZWVkNZ?=
 =?utf-8?B?b21WQUZaUkpURTJUZ1JVRUxXcDRWS1Qvdk5jMjRjSWJGUDBHSW1LMDVFVXRO?=
 =?utf-8?B?Ylp0aDc1M3pVeXZsSDVCUHZ4NjZMZWUvUlhTaUthdHNveU8vbE5ZZVo0S3Iy?=
 =?utf-8?B?eG04L3B0Sld5ZkwxZGR1M0JhWHh0b3k3QkFteTFlV2JOZG05QUM1bkh4NFl6?=
 =?utf-8?B?eGpyaGoxYy9BalN6U0NBMzNFbVFpQmcvTHVKYW5hUEQ4S0Y0UDNwR1hQSExL?=
 =?utf-8?B?eSsyakVyQWxqb1puTjlFd3VYVEJyU25jU3NsS1RsUDdNd2hlWDNMd3VyaWFQ?=
 =?utf-8?B?RTNwVDEyUnBkM0oyWlBOUi9PZ3krUDJMaHhSeVVxRzlPakhPdy9EZnFRR2tL?=
 =?utf-8?B?M3lKRXIrQ3gxUk03TW5TQkFEWVJ3L2hSdmkxUHNSMkdtbzJ4M1BjZURXaDBJ?=
 =?utf-8?B?RWVGUC9QTm1TN0JOajNrQzgwWjgwYUlxdmFzQjNab1dpR3FBQjBxVWlOY29z?=
 =?utf-8?B?dlR4dENXL3g5bW50RFFZV3I2Q0dMbUkyUk5lai8yVUFXN2I3aW40Rm52RGxv?=
 =?utf-8?B?MkRtU0ZpYmQ1VzB2dk1SbzV0MUpIbDVKcGxJbnIycy9ZNUI0QnVXZXJlQjJ6?=
 =?utf-8?B?ZDk5WFMzQWxxcDR4eTFTWkhyeEhmbVU2TXNGUnF5K3NNUVppQ1lMdWY0V25w?=
 =?utf-8?B?bXZMbVZNMDZNR3pjSVlJeUdwcGtmV3BmNlZnUFA2NjB4b2Z2Nk5CczZpb0tQ?=
 =?utf-8?B?RkcvTGViWW9iQUc4dlk3NlprdVhuWmpOQlFDVUlCRnh6Y1lYUE52UE1md2l4?=
 =?utf-8?B?YzFwWXBQVFh3K3RyVnJuNEpvNHRHVS9OV2ZieHRmbmkzVFdFaVZQWU1MYTRJ?=
 =?utf-8?B?WlZjR0VaYk05YWFBemVzM1c2MWlZN0Rka09GRXl1dkNRTGxvNlI2WmluT2hP?=
 =?utf-8?B?L3NTd0F4MnB6NlhuVGp1akRVWklPRmxwUE5UbVdweGlSRjZrUFBIRDRySzhh?=
 =?utf-8?B?b1pieE5hbDE2V0xpR3FiMkhFQWE2cDg5Y3BMK0RLQjNEb04rekRsRFNlRUpx?=
 =?utf-8?B?M2pvcHFmMFExRVQwRlRDbVdjZmlhNm1Bckk1Q09PMjZKWGNNMVFoUGdxWUpx?=
 =?utf-8?B?UFlVM2NvNi9lQWFVWlV4WnZMT2hoT0hQTWcybHNlV3JJN3Y5VFVtRlNwdzlz?=
 =?utf-8?B?QXZrRU9mcG0xQnNrVHB3TUo1c0Yya1h1QU1kbFdTUXFQSk5BTzVOVStrNzlq?=
 =?utf-8?Q?V1Mpr9KP1SKZDpx00gjzl1cHEFRHDiVs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGQ0ZFpVMXFnWnllSlg0eTJwQTVsNjFBOVkvanluZys5RWd2Wm9BTzFZYUR4?=
 =?utf-8?B?TkdWTkJHL0NGOUlBOHovTFpybTBDQWNtOVoxcTBvb0FFcElncVJzeFNBM1B1?=
 =?utf-8?B?aXJhRWloN0hZMkVjdVVjTDAxbXlUaUFPdCtPMmJrL05jdmY5NHRrVG5iUFkz?=
 =?utf-8?B?dmMyT20rTTRQYzVnSXJ6dE82SzZqS1pMckUvYlIvS3lzaHVhT1dkMVQ4SWlt?=
 =?utf-8?B?ZGhxTGp4YVBQWitZNHJydmdJa0o3NW9EbkhnWHdib0g4REE5OGM1Nng5eklO?=
 =?utf-8?B?RDdmalFyN3V0cGVrS2xvaVE0RnR6U0kzWEpiYk9iNW0xWC81TmRXMUNrU3pi?=
 =?utf-8?B?TzA4Qzh6WTVJRDRpOEpwYlhwN25FOVBGN0JCcHFjRFVIeWJuNEpHNXpJUjZY?=
 =?utf-8?B?enhqUlBhVXFjY1dhKy9EbEJrcDJhZ2VqZHNMYmk2RmZMSGh3V2Q2UjhzdDI4?=
 =?utf-8?B?cHNqaXV0QjlJSHoyU1BsekxSd2dVZ0M2UTU3WmFtRTNyN0tXenZYU3JqNFRP?=
 =?utf-8?B?a3lpUHlBM0dRNmpCU1F3TDE1ck5ocGd2MUdXeG5mMDA4UzgzQWJFbERDMWUw?=
 =?utf-8?B?ZVdGbjRaVlRuVThqbWZZSDhrMkVGN045TFRSNWxkazdFeVpIUWRNZDJNclIx?=
 =?utf-8?B?ZXRtcGIvNTI4cDZrU3U3RVFheHQwWkt6MkVKclpQWXBZSkNiR0RIKytIbERy?=
 =?utf-8?B?N2FXVGp0UmhqNTdTZGpzMVJrWUhNY0Q4M1lJS0NtL0NqcFcwWDYzUVNUeW10?=
 =?utf-8?B?b0tBdnlNY1JaQTh5VkV5cVZiZGtVbDFnRmVvY3FlSnBXSzgrKzhLNUFtc2xw?=
 =?utf-8?B?VkpKbGRLQ0FjSDJQRDlmZjVtbmpEcFJxRHpvMkdKWEcwVy8zUWJTMjFUQy9Q?=
 =?utf-8?B?TXVjbTBLMHdvTnhTRGh4aklsczdmTlNOajh1MUg2dDd0NW1qaE9YcHJvZXJD?=
 =?utf-8?B?SWtUeURiSkRVeEtWNExndk1VNXhidTNSdEVnWEdKVDR6dEViSk1PdTJWWXFx?=
 =?utf-8?B?b1RlMWd1NGNIRyt3eFhCY1JyTWZPSHV3cXJnWmJTOEJwMjhIRkcvN3RSeWlK?=
 =?utf-8?B?dG1IVCsya2xmR1lQRUg2YkZ2WWprM2xSK2JkaWlKMy8xc3QzbVJWQUh0Y2F5?=
 =?utf-8?B?bU5XYm1pSmZtR0pIcU16V0V1MThxWmp4ZVI2dUQwajVEK2xEenczbld6QVZi?=
 =?utf-8?B?YnBBTzEzRGVndWhzSmM1WTFnVXJyNTBFUnE2WUYwdENoWG1qYUNKOGp4Y1lZ?=
 =?utf-8?B?dk10em1na2VieU8wZC9ad2RxR2dRZWdpSlRkYnIxaHgwWmEwdnpjcDBqak41?=
 =?utf-8?B?S3NJaXd5OCtGZUxHcTBNR0xaM3pWeU9VY1hmbEVuS2Y2QnZQTEl3K2MwRVJn?=
 =?utf-8?B?eWFuK0ZRTmJyTDk2Qmd2R2w5dEUrQ3VFWTU4RW84VU40K3FxcUVBWjBJR1p4?=
 =?utf-8?B?RkRoeEd2UXo0S3FDYTNsM2MvNTZJakVlUTg3czBmeTVOeHlwZ1VTb0ZQTHhT?=
 =?utf-8?B?QzVBaWgweEYrQ0U4K2EwRzVpQTdjMGRkMEEzbm1yVXRXV3o0NWNoR3FoVGNL?=
 =?utf-8?B?WHVqWWF3QjZjUnFwZHBKRGYrcnpCMlRHeGk2R05ZOWZaeGpVTFVBNTZoTC96?=
 =?utf-8?B?d1R5OUZFbnlLOG1ZUms4TDBDMkZOdndsbFlIQm9pRjArbldWVzFUTXJnL0p1?=
 =?utf-8?B?MVpHQnh1WXdmN1k2dmVMNS9VUEt0djZRTW8yYnF5K1dwTVZrZVZBM2pLbnU4?=
 =?utf-8?B?LzFKSHZuK3BKUHRaK2ZTcnR3bkhnbzVMNlpTSStQcUlaZVp6Z0dTaDFhOWFx?=
 =?utf-8?B?M2lEbkl1T0lza09DZWdPWE1WZDduWlRLK3hmV20waVlaSE5HdHFUV0NSb3Rt?=
 =?utf-8?B?UmRSZnFnOG9idkcxOVhGZ2FreXhYTGxRSjVESWQ0c0xSQzl6b1M0UzNqajNi?=
 =?utf-8?B?WFc0cDhEZjdObGN3NDlFQWI0Z2VnVUJZTjZtU281L2dNdHZpS1ZOTFZMU1Zp?=
 =?utf-8?B?c2k4U3JDZngzZHN4SWIyS2hmOGNzM0wxbVRNclIrdlh5TDhyYzdTNDNYYlNI?=
 =?utf-8?B?dHd6S3FKamxBSk9Ca3ZxR3lhS2toVG9kVG5CU28xTS9rbDNpUDZCdUhnTUtz?=
 =?utf-8?Q?2VN3jhQluQDAbAHXJXbNGxcZu?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b073f8f-24eb-4ecd-213b-08de0a3ebe28
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 09:56:13.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0yvaixSTAp6mg1NsBSFlLnJy2i2W8k24W3xla6cOM3FoCiL3KA7HCmvEw5wm371lygfaHpW2yDidH620LvI+AVMdPvnPbl+70MHCu3WFoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7779
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 09:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7690

Hi Antonin,

On 10/13/25 9:12 AM, Antonin Godard via lists.yoctoproject.org wrote:
> What we have is OCI = $(which $CONTAINERCMD) = /usr/bin/{docker,podman}.
> So we never pass the current if conditions. Compare against the basename
> of OCI to pass the checks.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


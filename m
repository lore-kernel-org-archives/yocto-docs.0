Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA55D2D10E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:22:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60108.1768314155157830521
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PU+9B1bT;
 spf=pass (domain: cherry.de, ip: 40.107.130.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W54ccN9kPVJ9WZXSmtvKpsTaoa5npehRAKYT0vBiXtVDq4QIWXGc51Zu4TbgRUvp+9bHbSOMjQ5uK59j0fohtP+ItZTMe7faoS9IXWCA9hPE5wSeBGPWWjn2GTNG92Dti9hd7XtdRfQYFbsg7/q13nhQzUypWQBXaoVJApyc+tbak0KC/MMlO6SCUBApy547ML8h9LVcz6oUI2r6uWfC6XmWPJnpwaPKy2vEsT52INOsp1phuLz1AQX5mvaQk2dpmHSCAiKMUWB5rIMgLP4ioLeYp1PxPsHMi51g9rH6M0SwD0dsD9wvGVQz/saEsZLYX5MlVzqntUhAv4zPXgY07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSy/BwoSJ9u07W8jLtOJ64RoI5iDY+gmGz9RPPv+LGk=;
 b=DQK/dnjyj1pjbu3Auo8fdXilX9gURcCNB7pArUVTL/ysPmCCSlEbN67xkU9qYlEOti79nYAeDqm/DgpJIXsVZ3G3bx1IB5+WbP0k8SBauh2wNhPr0KIbt3RvvQkzC/DX5IGjLW7Jx4+gMSZQzVJF006ST7jFNeaKPNtTv9RJ+dTet90kuJpYIJYBWGDeV34tQO4EsrYGR7KzAddSO3MTW20tI9yMkQC7bJf+uaoB7pP4MA2RmdBSvy3NgtlDWCHze52QvcCmLn9CcAn01znp51nFedJtx7altEcMWStyYHKjbVmt6paEDvT0aH40TqSGpChfD4Wi5eMjs8V8PUTO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSy/BwoSJ9u07W8jLtOJ64RoI5iDY+gmGz9RPPv+LGk=;
 b=PU+9B1bTpvbn62SWN7KylvRIvo5zEnuuLh4N/jTOSrIm09B3HUzAHj11pwGfiSwd0V+oy123QWVu9NY1+iwl6W19t097BJUvZHHDvb2cTIXHOAnnypIFQftJpeCK0ZaozrJyhWebyCAQyaGx+eZDAxLU5GqjJDzEGQftD3sRkFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB7095.eurprd04.prod.outlook.com (2603:10a6:20b:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:22:29 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:22:29 +0000
Message-ID: <963d6148-7a27-4c56-a6d6-68a1b244e5a8@cherry.de>
Date: Tue, 13 Jan 2026 15:22:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 28/53] ref-manual/variables.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-28-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-28-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 63df1465-3bfa-46f6-8634-08de52af2f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmFqQm5WbGxvZFZmYlJvTGxFUWRHNWNjTmVuREJYbTlhMGVWVU81enRlb0Rx?=
 =?utf-8?B?eFBQUkVqd3V6RmNVdU1ZSldzOWpEUW40TGJHZnRUd1FMU1lGSVdQQU5NbGFW?=
 =?utf-8?B?ckRtWjZ6R0o1M1J1SENQZEthY09pS3JQQkpSUHB2ZXA3Z21WVHdYWGVFaHBk?=
 =?utf-8?B?WE5UVWQxMEhsVHJWTzFTcEUyVERVMThwVHVYVlBZVlBYcWlyeHA0Rm1aekFG?=
 =?utf-8?B?SnNudzh2N2lISFducE5BTStsMktVTFZyY0lYcldWcTRrOW9may9ZMmtEUXhz?=
 =?utf-8?B?TGFtNVpjQTBRVXlnRHNSRU5vV1VKZ2dTWWZSbGI4STh6cmNKdjRONk8zc2JL?=
 =?utf-8?B?T0tuaUt0MVd3ZkdpTzkzRWhTRjBqbloyTXBYQ2xBSmNtS2VveGZxSjY0dTBz?=
 =?utf-8?B?ZFBOSmJKWHFoeFdMbk80TXRab3grdFAzMWFlTFd6MXhrNkFGMFZ1ZXpvS1lY?=
 =?utf-8?B?YVMveFVIZDgrTzl5OVU1czJlY29uMkwzSUdvNHZCN1lZN0J1N0NjYVc2RWEy?=
 =?utf-8?B?cjMvYVVsZllveFUyV0ZMWWN5ZEhGUXBCaFgvemtZNFkxTTQ0WUdLaWljME9q?=
 =?utf-8?B?NTh0MTZuMTdoaVY4ZVZQRTgrUlkyTVdVK09GQ3NPWkdmMHFialVOVzNhUFh6?=
 =?utf-8?B?azkreU1qbEgzeFhJWkwrWXpxdDk5ZHhENEFaR21hZFQ0a3pPWXYvRnFxZHlL?=
 =?utf-8?B?bzZYcUozWlZScUlnMFFJaTIxZkNuWDRqeS9EdXJadjVqdDRyT1VVMGlGRFRw?=
 =?utf-8?B?ZUFRdDJpK0phaFJ5QkFqMDdMMnNDcHpaWkdGMGRxOGt3WUllNHNzOG5TdHVs?=
 =?utf-8?B?cklubFJPSjlIM1g3TVZzeG5WalJwTHQwVnB1SE5FaTQ4U2NhbHBvNGt3d2VZ?=
 =?utf-8?B?aVVISnBUV3lzaFdialF0OTlYUEE3OS9qTEpDZUt6Z0NOdXlZZnNOcnkwVDN6?=
 =?utf-8?B?UFRlT25hNVhMc3JLKytHRGdQTHRnY3pWRnJ0cXh2d2ZZYTA2a0lYekhiV2NU?=
 =?utf-8?B?Y0pxL3JZZ3BxZ05qUHlxM2RaVkliSjVtSzRLTFhGSitlR05uTURxQW9UZWlT?=
 =?utf-8?B?ZEtuRzF2TTJyQUgrRExCSFk5UUMySzJsR0lza1ltc25oWnBIS0ZyeU4xeVNq?=
 =?utf-8?B?VHpoUVBDNnZYak5Ya1FLeXV1SkNiVVM1WTNmc3ZoU2RXd3h4dW9OOTZpWlZG?=
 =?utf-8?B?NmNWVzJKZTZYRnd1TWZFdUdkTEVFcVhRbko5ZExyaTNNWnRzVVVxU0ozeE1R?=
 =?utf-8?B?bVgzNHZpcW9IYzVmSHNqNkcyRDZxS2UyZ0h6TXBtbUxJVFVFY0FuanM1VUxT?=
 =?utf-8?B?RFhwSDVWMnk3UjdpRmlqUi9NTU9ZMkE1dU1ybVJwZHo2VDlwaDJXc01WR3Jr?=
 =?utf-8?B?dDdyVHpqWU9nQjhLVHBIUmhnWWttY3BHK2lOZURUVUVDMWNvRFE2T3RpcUpi?=
 =?utf-8?B?MzV0NnVtaW5lWlBJN3ZUVnJBL3E1THF2cFp5L1ZPTUZNbHFzemVKcUZjZW1k?=
 =?utf-8?B?K0dOVnZrTE0rVHVGSTloaXN6bEtVZ3ZXZE5hVm10enNZbjZHbjU1Vkw0cVoz?=
 =?utf-8?B?eEplMlhOZEs3VkhnazNiMzB0NXoxNkV6WUsxRkdkYjJrTkF0S2JmMk80VEoy?=
 =?utf-8?B?Y2VKWmxuZ0JlQnA2aHZhRGVWSDlWOVRBdzVidHJhV3BoZDNPMDZDTVlMQnlN?=
 =?utf-8?B?NVRuUlYwY0hSSWJyRTFnblFGUW43NHZmMmVKcW1WTGgvL0lWTHNzN1hiUDJQ?=
 =?utf-8?B?TlF1TnBOZUhzeFRUOWpGcTQ3VnJIcVI5cmVsNFRlRk53azQ1aVRQNEt3RDR5?=
 =?utf-8?B?cFppcXY4cXA2aHVLTi9UWnhaakxDYjl4OWFoYjFzU3NDOUJhMGZWZmRoc1Jr?=
 =?utf-8?B?MWZrWnRzYndaVjBkaUZtYkw4cDEraFUwT3ZuRGdJQ1FzUnczOGNtSHJmRWFS?=
 =?utf-8?Q?nM0Yh9g7itrJzdEzY2Rx6AZgQgZjJpp4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bmhOYVhwTVdHcGkxek1mVmtOL3pmaGg4VStEWDdSd3Zya3EzOTd4VVFKZXZz?=
 =?utf-8?B?SlB5cFUwUkVtdHl3Sks0cWh2a3dIWUxTVGU0ejBqaFExdGpxRnFiY3VIRlFP?=
 =?utf-8?B?M0lUbVArZ1ZMTzhKaVM0T0R4MVordEttWW1qb3lrSWh1czlyN1dBME51UHhK?=
 =?utf-8?B?VWZ0OVVBKzRCY1pJNEVGbVlNT1V2bUIrQjE5TThwcHBqT0c4MVpOSnBlRjJH?=
 =?utf-8?B?ZEczVXRiaGRSZVV0L1d0ZHo0WE5xOERnd3VmNVVua1FvNFZGd2lTbjZwVGVL?=
 =?utf-8?B?UWxGdUFNa3Z2dzBqWnhYam4yTXVDQzlSYTFPNElNYWlYN1dQcGpodThZKzJV?=
 =?utf-8?B?MmpVKzBvd05IdEpkY0Y5bk1kbFdqMDVYdFhiM2c2SXE2YTJhNzdLZkdxMU5v?=
 =?utf-8?B?SWFHSGxCaUpReWlmcm1uSzdSRFpmRDRMdEMycDcvM0RPOVNIdWNLT2ZJWTdo?=
 =?utf-8?B?UFF6OUxoMnd0ODg3NVBBY2lnRVVmdEpxS21kTzBrazQySStLV1plMEdRUVVH?=
 =?utf-8?B?UHBKTU5zVDNhYnNKRlFHb0laUkdUcUxoamRCVzdnYUg1bzJUWU5CNHVnazBF?=
 =?utf-8?B?RnpNL1pqM3kzN2NYdGtVSzJyM2s1NnZkU05sS2puRmE5SldReUJ3TE5kV1dB?=
 =?utf-8?B?VTFoR3JGQWQxMVZRSXZhcVRaTjF3VGpKRjBkTGpnV2N1a2JHTHRjUnBlbzdM?=
 =?utf-8?B?cHhIczRvb0RIUEIxWk5PRDZXWHI4LzlhMXBYT3VuejRFbExLWjZRWUd5bExQ?=
 =?utf-8?B?WmZpKzk0M0dURVZFNWVWUEFPQytNWEJ6VnhubnlLNG5ZTUxVMitzWnpPcTA2?=
 =?utf-8?B?dk5YRnJwUTVPem5JTkMrVnBueGlQYUVLNTI0YXRNSjN1b09VckFsSFdTRXNW?=
 =?utf-8?B?RUc2aHh3MmdNWHBPTXFlSFpoSXZoTnRtMWZXWFFnMUE5TDhJNW54aW5ueFVW?=
 =?utf-8?B?RlNVQnJpYmlyd0pHdFpSd1lBbGtjVzRmQnprb0RXS1NFWFR6QmUwdGMxQ00x?=
 =?utf-8?B?WFcvM2VteDdFR2YzbVF4UXlBRDNUS3JzMVg0VGdGWkJ0TVJXRlprbmpkcVNL?=
 =?utf-8?B?L29sRGxHT0t6ZGdmMHQvVGszNlVHWFF3TEVoNHhmZy8vclFGMnJ3ZGl3UU5W?=
 =?utf-8?B?SjArZUl0MlluaFZwNE5RcGh0N3lqVmlGVEROaktQMko2eGl5UjhFSG8zeUdR?=
 =?utf-8?B?d2FRVHBSRWh3QzhVZGRhNmRUc1E2NiszeUtLME4zU0VGS3R5eWpBUVQ5SmFS?=
 =?utf-8?B?UHVOVnlReWhtb1VaUHpoMyswYkVaSkJ4WnZrWCs1SFdQa2dFd0RaTEJuandv?=
 =?utf-8?B?di83ck1wUG9mY3dBcEMxelBXM21aQURaZWMrZStVa3BlYUc5OENZS2V6Zm81?=
 =?utf-8?B?VGdCYXg2bWtpd3RBa1JtVGhaQjk1UURmNVhQUUhRSE9NWlQ3SnRiVzNQYkhB?=
 =?utf-8?B?dnh3OWl3Z0g4ckJURTFab3RDelI2MGlad0Uyb3BCZXpOUFB5alhqOXhiNTZ6?=
 =?utf-8?B?TjFRTkZQYnplSXZ1OVljbEhTeXI0N0Jmcit5WU1PaVZWdll4ZnVBcWxFMWJF?=
 =?utf-8?B?TDFxUEYxbVBuclpHZGRtWUl2OGJqYUMreVAwUENma05RL3R1b1g1NFRzemxp?=
 =?utf-8?B?c0hwZUJOZDBOVzE0Y2JOSEpNQ2tyM3J1aGQ3M3h1Rk5zZU5xT2Z3cEd1ZktR?=
 =?utf-8?B?MFdacG1CelByUEtFVjkwVnY0K29ibXJESzVjdnY4aldtd3AzUEpxeHdteVhL?=
 =?utf-8?B?WVozdUNGZVh2REJrbWczemluanA0azJ3Zitia2cyRENGSE9KUGZ3SG5MM1A2?=
 =?utf-8?B?RUdlT204VTl5UXJpQzk2WjZpaEpjVWxVN3RIV1BGZFRsSm55K3htMldKZFhn?=
 =?utf-8?B?UVQyVXNiZDN0cjE4WDhKMDU3MCttMGQ4dVhlRVJZUFJiTjk0U1dmRFZMNWZD?=
 =?utf-8?B?cnlXNEZaUE9aaW5ZQitUOFNjVFFMZTRJUWxlMUJoSm0xRytKRTBXSEFmT1Bu?=
 =?utf-8?B?b3dMK2NaVE9pMERHZ09YS29pdGlwK3FsRkVTNldNclljemQwV016UXdUM1B6?=
 =?utf-8?B?MHR3a1cvS3gzMGlBZFdzdlpwU2hCWW01L1EyTW1kbnNISlJSMUlWKzZ4aW9U?=
 =?utf-8?B?ZmhiSWhqSDRtK1k0azNXa0o1d08xZDhqMndkY1V2N3FiNmVIT0tLVlBZbWIx?=
 =?utf-8?B?WWFURFhBYVRyc0FSSjUveFRzVEJhQW1ZLzZYU0gyTVgzTmI4NStEZ3hiYWlp?=
 =?utf-8?B?UzFFMFJxK2VPZXErUDV4YVhORml3amNkcFN5THhEbGNUNktGbUxxUGMyTUkv?=
 =?utf-8?B?MGdNWk91Vk9HWjQzZ3FrZldBR2kxYkJHT3lid1FHSzJ4ejEyaXJQdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 63df1465-3bfa-46f6-8634-08de52af2f03
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:22:29.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGQ2/e/MyG4Xo2ufYU7xrzNucGusncA+sKTOk9tUnGG5wXRcfvjqEAT7ZI3hE7U3nN7S7k7y36nwW4lSb3ZIB2J/fZrcVBWGBVylIcIxgcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7095
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8517

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


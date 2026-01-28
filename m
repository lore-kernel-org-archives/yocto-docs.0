Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D5DD25B7E
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:41:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13103.1769607707734114817
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=I6n/5eHn;
 spf=pass (domain: cherry.de, ip: 52.101.84.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjsThHYBymeLPdUbBgA7mQmesEXPG1YAKEtr+Xc97SQcgooFbqnmg6Jhqf0rKUmCw7jjy05+JjDx9JVgY3JxVWZqAtS5NAZPrT7x5vfut/rBxgdvWS/tFbHr29QlXork6V66P3gVFSotYVSZpKWhEmYzfCLLIzqOel3HHXOLo4wwy4I4QLZe111kqofDl5jZpa0t2JTMJRMrDwyYlVZEsuA4x+jRZWLAPYxvf3p2S7zD4OzcG3w8YtNzZO0o6tVgWxkOejW5MMWwZJqTucwzdt7Y0NX1Fs/DTrvJSr6O2LTghXxFU/hASkAGKPAFcrjKqXaVN0QSCbQsHoF/flF+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=rYM6W6gYC6E+ju1pipkazp5WA9XkNZSyyAqbW6A7amwqkR72YxdOkCkNATQ8tqmcH0mCeJoPh9gxzT1BzZTLgYuqmNyLmVjilsM4/Z+f+PElJmQnlcSWjoZyYUBrMpAcHfHwxUq9crj9CErN57ThkkBhp5nuZZO2RH9GBtwlwdmw4sjU/ItD5JEXn4Q+WQHkMbw9Ykx+vsPej8Mlhsyor11v8/BSDW7QM2RHKsVJXpCiiF/Q2HLWw0IVPvq8RsR5M5QW8vBdpEmii7aY+5vq8Hf37Qbn/Aa8TjT5mzU1MA8jCxODRUK34zOA+pzV9u5m1ucH3HGYCq1tCscnC8MD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=I6n/5eHnXbyFeFAEXghbQCPr1EUKlkjjfnq7vkf1DFMMxaPGC8j/6e3Vn2oPklxmJrBTsyfi7C9I/2qN/FwlSu1kgDZp7v0+OGqxUlovDhks0FtmXbxh39XuVTEumgG12dxJli8kybxc5RFUVxzgclE/BdcWo2/0E4coIB9Q/mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10658.eurprd04.prod.outlook.com (2603:10a6:150:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 13:41:43 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:41:43 +0000
Message-ID: <3ec32f0b-ebdb-47e4-90ff-3b044e6e68cb@cherry.de>
Date: Wed, 28 Jan 2026 14:41:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 35/56] dev-manual/build-quality.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-35-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-35-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10658:EE_
X-MS-Office365-Filtering-Correlation-Id: 6765f527-70e6-469e-34ad-08de5e72f935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bDdWMVFWSlVkVDg2bmN3bVozWmxpcW92UFNpY3M4cS9tZ3YxbExlaVFaZmJL?=
 =?utf-8?B?Nmo5V2Z6YlJ3UkN3dG41LzBUS3RZZUFjTWkydEg5TWUvOEltRno4dml3NVlW?=
 =?utf-8?B?cWliTmtvK3hXenlpTkpYM2RQNW1wS1Z0MWxMdkRBUllVVWZZNndDYXNmTjQw?=
 =?utf-8?B?RXZYL2lzSFl2Y0lmUm9Ldzk5bHlsRFZSRGkyclk5KzBsNnkweXpudzM1TnRF?=
 =?utf-8?B?U3JJTkprcSswdS9iMzlGRFR6TllSWmU0UnUrWEJRWkZiRTV1a05aV3Y3YVFC?=
 =?utf-8?B?eFVoK3dmNVEvNFZhbnVNZXBKVVN5RmtnNUlRN2Qyb1V1ZzZpYXB5SVQydnRN?=
 =?utf-8?B?TW5kT1NKMzRMRWFZRTZZdGJCTGpQQ0diZE9sbTRKdkc2cXVQVzhlandkVFFG?=
 =?utf-8?B?YmQ2OUN1Z0pUZHR1QUdnVXliZU5WSmRxUzlVZWpoUGZ2MVJ0cVlqQTVkTm5L?=
 =?utf-8?B?R1NveThZK1kydDNJaXpya3pORUtmRXRaUkRuUXk1N0ZyTW1Ka3VKVkZYb09r?=
 =?utf-8?B?MFhaY0UxM29LWFZpWi9LTW44ak42LzhOU2VsL0N1SzlqQnh3aTlpR1FEMDIw?=
 =?utf-8?B?MmFUWjJRS29VSDFPb2FnaEJWcDY4dlRpaUtJNlpLYjFyeG5sMjE3OS9XYXJu?=
 =?utf-8?B?N1ZuZm9iWTRodXV5WWlpYzdqcjdZTnpJdThLTS8wTnB1OXhtRlFUeTROTGlx?=
 =?utf-8?B?T2Jra1crT21kYlZ2ZGVOeFpHY0IrMmYxM0JTYWNmMHh1emdYN0dhZkpTUzRV?=
 =?utf-8?B?bEJMY2pPTWpRNlNadGQ0b0IrNklvTFpPeitic1hpR2VWMzU0UVg4ZVU0b011?=
 =?utf-8?B?bEt5bWd1dEM3WG9NeFpBeFhHdlF0Z3Bmcmd2TnpKWmVzR3JFSlZvYXBLaCt0?=
 =?utf-8?B?S3ZCejRBVDNRT3RjUE9ZUTB0TndyUEhMc1g0K1hUMVNZdXpXdjhZSlpLS0JH?=
 =?utf-8?B?Z2pPT1JDVmtWTzduU1FQSHVsOWxrWFRXWjY2OE9la3VEUkNhcXlUZ1B4Ylp3?=
 =?utf-8?B?QWZmVk52MnhOYXRSeUtGSTdVNmN4N01ERDZRczFsMCtMQXlOV1p3eDY5SlYv?=
 =?utf-8?B?elpKSld1c0VvT2dPNmJuMjVCVTdSU0hzZUZ3ZHBUQk9USWp6c21ZV292d0pp?=
 =?utf-8?B?RFRHNHZMV3JkQ1N3RHU5Q0JmWTJSd1haMFprTXJ1dnZnOS9YNXJLOUVlMEt1?=
 =?utf-8?B?RUVPWVZZcEFCNFZTYW5Fc1RCcGJhZi9DalhsMTVCNHVoYVI2eXVWbzg1NjJH?=
 =?utf-8?B?Sm1EbXh2SDJzeVo4NUhUcjlrcFoyc2RPSkJPR1BkSFY3VTdJUDZtS2R2VWJS?=
 =?utf-8?B?S0ovSEdkcW42NzZMM25lUWlEZ2JDd3hwc2dhaWtEblhZM29NZ1VlZVlCZXo0?=
 =?utf-8?B?UnZoV2g3VEdabDBybFcwbVZ3YlRJSFl5RExQTU1uM3BKVk5DbHRwM2FTZkxh?=
 =?utf-8?B?NjZPdWYzTG91Mk9xV3FzNlVDcDlkSWd3UjFneU8xV0dLVnovTGxvSm5Hajdl?=
 =?utf-8?B?Mmg5QjBmMlhWNEh5MkViVXJSNnhhUzYxaWlPeEtNQjBnbUlQMU5aMXZ2elBG?=
 =?utf-8?B?VDNpRU5mbE5XZVYxLzhxMlNmOXNLaW5BUU9ZaEIvR3A2Q0pDMWF4VytldHNr?=
 =?utf-8?B?QVV6VU81UVd2aVloRlVwUWptMnMzVUNpcjJwN1NwOWJXSE14L2NLKzg4VFh6?=
 =?utf-8?B?S0RWVnRod3p5NGVVdG9XdkJSUDNtUEtHUzBMb3IxY0tZWVFCN1FmQ3VlNWwr?=
 =?utf-8?B?RmE0S3BoaXo4VXhmSW0yS0UyYXpqbnFwQ2RDUVVGaFlXL0pqcko4MnZOWWM0?=
 =?utf-8?B?ZFRpcVovL1ZiRU13eEJ3WlNRRlNrVEtaQlM0OUs3VWV3TFE3VFEzaEprT3BH?=
 =?utf-8?B?WGRzTEFuTk54Tk0wL3lLcitRYnpOVGR5cEVweUZvN2NwWG9RRDVQeENjeTdx?=
 =?utf-8?B?ZlFuOE5GcnBtWVV4V0tnd3NCa3EvUFl6emllR0VCVnBwbTZJSW8vRXYzeVdt?=
 =?utf-8?B?dUdURUs1Ym84cm9wc3gyZXptY091T3FCenNqakRDemQyeHJPZ0ViblRicFF5?=
 =?utf-8?B?b09iWnNyRzM0ZVQ4cHE3T29sNnFoVFQ2bmxFTXpIS25DZHViWG1NVnM1THBN?=
 =?utf-8?Q?XZmI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTFEL1J2NGhZZWduUXRzS25qUU4xL21rSWI3RTBYR01hS2R3K0FuVnNWK21F?=
 =?utf-8?B?UnpwS1FsZjdhcGlETGZTM1ZZZllza2grUTFJd2xpZlhlR200YXRURno0NEZ3?=
 =?utf-8?B?Vk1uRzhoNHd4eFk1a1V2RFgvRUptdHNvMnhtOUJUZ1ZzcHAxdlpEbjlyUURD?=
 =?utf-8?B?dk12L2JPUm5qTVhEL0txbnlsb2YxSUd3QjdvTzlzNkNYYm9qMEFVaDRNbzVZ?=
 =?utf-8?B?KzZRVjV3NmVJNTVyNDZvS3FPRWRkK1owQUxuZGE3Nm8zMTUxNFZiU2t0eVcv?=
 =?utf-8?B?Uml3NWRYSWgrT0VTRHlOalc4SjlLS2ViVHBaQUYvYVhBcHh3RmxBOUhZQ3VU?=
 =?utf-8?B?MGpOK2JWcFAzS2drNFFsVEkvd2xzRWdBdU0xY3pSNGRvYnoxUmt6dWRoeE5x?=
 =?utf-8?B?S2JYVW9MU0NaTnhoTndrbHdFL3pUY0ZWYnpINUU3SzYxTngyaEd0ZXhRejlS?=
 =?utf-8?B?UE9CbEU1ZC9GZ21CbDlReDd6WGFqNkY4eDJaWFNSTUJ0UENxNlkwQU5RZERB?=
 =?utf-8?B?TkFEL3U0UVNvMktFaE9nNUZyVmtlOTQvaUJQek5TTDNqcXpJVFdUZkQ5ME80?=
 =?utf-8?B?K003WG82SWtCVDFoQmtvL1FUbjYrR1BvNFNROU5oQmlXdVZwb0h2dTBUMjBN?=
 =?utf-8?B?TEpqK1FESDluM1ltWXRNM3dDREd6cEdxclBoRWZsdjZ4ZnIzLytjQXM3bUc0?=
 =?utf-8?B?YlBsWGVVb2pZNzBtenlvUVJFZmNlZ3puN3MrREdqUGd5VDJTM2JTRjU4WjFJ?=
 =?utf-8?B?VVNTc0RoU1FlZW1JanpWMjg0OXZ6bGpObytsMERqL3pjcjQ1cTVhemRFbVdF?=
 =?utf-8?B?dDVBT0tqTFpCVXY5WWQ2SEdnZExHQjhLdytTbUNKdWlpT1VrTEpLZHFMN2lW?=
 =?utf-8?B?QmNUdmtUc1h2L2RObHJWNHdZbkpyM0VZZE1hWDNST2xaZC9wSmpBQXZvaS9D?=
 =?utf-8?B?aWowK1BVY1U2QUlqczRqVm5lbC9OV3p2TzkrS2JPd01qUkRXTlY1T0hEbXBp?=
 =?utf-8?B?b1NFRGQ2V1hwMDRDbUZXYnhoUUFoZVI0QmZMbjJZdkJTZk1KbU1JbkUwVUlW?=
 =?utf-8?B?aERFcU9KelcxMnBIWUx6enZ3VElDYTRURGhvUkVHcjJIbTlPVlZ0NldlV2FR?=
 =?utf-8?B?YmtOT1NKSnp3RkFrWHVqc3RoTlk5MkVoamdxMnVsUGl5emJjRXRrTGNkK1FB?=
 =?utf-8?B?ZUVJRkxBendoZWNIQUwrV2ZVbldpN1pNQTJwNGFMaXc3bDBRbXpOS01jNTNv?=
 =?utf-8?B?YnVRbENhbUYxVkZlVlpOOFQ3S0VtMFh0Y3RIMEtXOXc4WHY0VExiMDNaY3NP?=
 =?utf-8?B?M08zS0lHaUwvWng4RFZyWjE3eTI3S0lvNEQ0azJUdGNwNzNnT1E4dU1SY1cz?=
 =?utf-8?B?QU85b3MyckFVNzJETnVYNGRoOThmRm02NlJqR3ZkK1VlVW5OSjlyRlY5cVZ0?=
 =?utf-8?B?VFVxS0pEQVQrVkxEb0xtVmVCU1p6cHNvdWs5d3MxTjlmZUpnZytQMHBMUnUy?=
 =?utf-8?B?QnVFWTJIU0JTVWtnMHRkdG9pZE5hckNZNjVqaUxOWmppaWN5MXIzL1BYSHFK?=
 =?utf-8?B?TWtiWWVnK2pMc0l1anFKenNPRm54SC9walducHMvTGxWbndocUlkZ2U5WFV1?=
 =?utf-8?B?VnlKME1EWDErSWxVclRaVFdtUjNuVGJqdEF0THB5MkQxRVdvSHFFUCt1THN6?=
 =?utf-8?B?bDlXZ29UL2dHWlorOHp1R0hDbUNyR2NBTU0wT21UVDhFdFlmd3ZOcWN0VnJC?=
 =?utf-8?B?TmxOTzZWWnBmVVNRTlJDbDFZV0NSanZXZERrQ1J5OHVNOFMvTEtWNFYrUG9X?=
 =?utf-8?B?L1pwOWdxZlZNYmt3VjlyMnRwNVd5OXdIYnM2Y3dQd2Nhb0tmKzhZR0c1OXRX?=
 =?utf-8?B?bkJWSjNlR3IzdkcybldzTWRkQVFFbzIyNzZZVU5UVUV4anJNa0FFc3BOcStR?=
 =?utf-8?B?THpRWXhMOXYrV04xWUdibStHWXQ0S04wNTMzaWI5ZHoxY1FWUU9mVFF3Wm9T?=
 =?utf-8?B?ZnkvcFNCa0l1aXpIY0NJaE1xaWRSWTdQNUZLVHE2bUZWT0dXSUU5eExlR2FS?=
 =?utf-8?B?MThBQlVlOS9vVjVXUVBVYy9qYU83ZUk1Z21UbHlveHNKYnVIaDdES2NYbENs?=
 =?utf-8?B?MVRmc1pXdmVUcG9RU2RwN3diK2dLOUtieEVYdkdTNVA4dDlnNlFjYitBeXk3?=
 =?utf-8?B?bG82aUVMWFV0RnRwWkhRNDRLT1F6ODlCMU5jOGpTK3M0RW1MV2ZHSVpickdL?=
 =?utf-8?B?eExpem9UbU9KZE41dFJKVkdrYmtveS9MaURFT3prZHJSRlJ2QW9tbHRncTd0?=
 =?utf-8?B?K285VVprSWFYNm0rOUt0d01pRW9ZUGMvbm5vY0NnY00yMWFOR0wzWG1wR2dH?=
 =?utf-8?Q?tdQ+pIPtQEVXwjEJ8eEDKOJq3HABY9xjXfDMZ?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6765f527-70e6-469e-34ad-08de5e72f935
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:41:43.4921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2BGG0CUL1Q8j56Cz4BLQTnCRJh9naskyjbQ9y8w3xtQW5/cUUptjTiiOSqh3x+ImGdFWg3KyBuAo2gqyBChRbFzUQ4XJhoy+IjT9L1sv10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10658
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8762

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FF6D3F098
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 16:47:42 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2067.1769618854403013522
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 08:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SQnsbRqU;
 spf=pass (domain: cherry.de, ip: 52.101.84.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aag6eGoX6AiaNzhCF2n4RWCjUHFt0VMcjyvDfJ3tj9eCcWEUmNVnecb5IZ4YPKFOb3tsiQhA5FcLFVauB4fb2YDLPldP2yiANxdj8gVcNR3DsisghxkNOVqBTNy8Yoe+H127/6DtvbPG+TTknmXZ+GANEGCmITEifv6Bs/Sj3cNuLexkYBbDDXnHUtSa/CBFmykTcYK25wuuqk+D+2mKyhWFJdr+7QADKzW6XVJuvPMZ/tLrR3NEJ4HyFM4lj9WJpPjn7r4q7VvGggvl7jmDzIn6XoaGB9xKV61XBsVaIj9fGTc0jof+vhimXK9p/b5246PDyBEppZVP4kg8pLglag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORRcM5QImxRft5IlDOROGVGRz7Bqr+YsuKJlTRgYfqw=;
 b=MzlEbo/UBSHFGCD0jerETFdncZbwes69sRjuCa5lHCDv72+Xp+p3UB1LXEjG9oDsqV8vdln/vax+uDNPTtnxx0+o8pqrvYBKh4ueFNCzVbSbxOjUU/6bAb0eyJy+Hnno+aKKnRUhtcN18mFSDFrR1PvWFsXoqEWNlZgQIIqvoJJ9Fmgq7Hc+dfMlPADLiYaKk8MCqoGsxX382hgaxyuLdluDeW55zT49+l67zqXFhZozLxeb4n4J1WvZLE61Hs81fVqGam0rkqm5RRCADi/bbwcs/FycdPmFjTpUvzb0PFTwOlIcNTuVYIVkJ1cJ4JyN5b7U/0wHYzQLSswlPv194g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORRcM5QImxRft5IlDOROGVGRz7Bqr+YsuKJlTRgYfqw=;
 b=SQnsbRqUFc0SntJUBh2PD2NJPyWEwLJnIbrhYU2cFsmpr0cz9i5urFiz8Kg169oz/mRh1OjyGb8dNT9Com80iRDpkrEXukSgGOHEPIkEaDHqcH91pUR+vdFSLy+C6OwIgWNUk2SyCswF3SmQRLNZ5MIpoykyfZFCT20wp0Jt3kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:47:28 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 16:47:28 +0000
Message-ID: <d8f93cda-a0c1-4f0e-954c-24934867749e@cherry.de>
Date: Wed, 28 Jan 2026 17:46:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] should docs explain unversioned recipe files and
 unversioned append files?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <fbd1c18a-ea92-1a7b-14bb-2ccbf0400828@crashcourse.ca>
 <95d28d64-2db5-4281-b2e0-2a42159cd891@cherry.de>
 <974c63ef-16c3-0271-d4fd-7a92b39bd8ca@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <974c63ef-16c3-0271-d4fd-7a92b39bd8ca@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a9ab6d-b2d5-48af-f9b0-08de5e8cec3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RStYWTVxTGNVSTRqTXBnM3FWZTFTUG1tY1ZHK2NiVGdId01CRXdRZ3RZaUE0?=
 =?utf-8?B?Y3BKcTVtTlphekZRY1VJaFN4M01xbG1iRiswYWxsUllFMFYyWk5yM3ZNcWZH?=
 =?utf-8?B?bGRlN0J2Uzg3YThjUjVOdHFxQkl4UjFXNWREbGRpYmlSaUtiVStGSjNjekNm?=
 =?utf-8?B?TzVzQ1djTlIrdWF4VGUzT0ZtTGg3Zlp1SFEwcGprMGZtNlpwd3JvMzRBZVZa?=
 =?utf-8?B?V05odkdFZjBNZ3NBSHJCUlpaaEhvZ3BIamRFRzRabXppQkF5dmZyeExGSEt6?=
 =?utf-8?B?bldJNW9JNUdjM0dCQktadVBiTmdNT3hlaE55NmxkckMwcW44VmtNUnlzN0F1?=
 =?utf-8?B?NjlOKzhmeW53ZWRRVlhhYW9xdFJDMkdTY2kvalRtdzBieEdwdWw5bWFNZTd1?=
 =?utf-8?B?czN5cm91bmM4My9NenkwOENQZHpDVS8zTnB5K0pGWlhWTFM5WmFVZEVXZFRs?=
 =?utf-8?B?M3dnTDhOK3JpSFJEcVk2RnRrcVdNa2FUZ3FtS2lBRnZkbXlvYm1Ob0hTVU9q?=
 =?utf-8?B?WGNYejBTVUJ0Um5sejhJVXRBVkJqbmY0Rk1TMFY2cWJ3UjVDemVNTHV5Z0l5?=
 =?utf-8?B?bDdyYlRZTVorTVgyMzlzMnZHQmVTSFRETm94N0VEQXhHTW1DK281dHltU2Z4?=
 =?utf-8?B?TXNRNDlNeG9ISDdEQXMyZjNYMDBRVmQ4UGdrU2V1ek9qK3ZQVG5vaTFjdXo3?=
 =?utf-8?B?cTZIdXRnVERSOG56RG1yZHZodjAvQnhteVVsOWJLaCt0aE5jZDNzU0RBUWdP?=
 =?utf-8?B?K091UFdTTk9KZkV2UlMvZDVWdG1vcWJldnVRd2U1OXVnQlBFTkZFZ3NISzh1?=
 =?utf-8?B?dVgwaEdMQVF6bklUZk5nQXZYdkRDc3lMR3NPR3N3elY4M0NCcnVNQ0hZdDQx?=
 =?utf-8?B?Z0F5cXlWQ1NFT0VHN0F2KzN1UWVBYSsySk5NREhSMmxoUmsyKzAwemhkUCtp?=
 =?utf-8?B?Y0Q4Qzd4NHpJUWcydGtLQVdXY20xcEJsbkMxTkN1MnY2cXFBdFl2aVljKzVq?=
 =?utf-8?B?WWVvZGZhSDhpTE1vWk9TWVMwTlhaWXJ5WUwySTd1V2tIVVBIYWhXRDBpdjBL?=
 =?utf-8?B?YStnWHFLNGVRc2tKM2gxK3IyQUtMUG8xTHl1ZkxTdW9vZVMrQS9QRDVvS3ph?=
 =?utf-8?B?UlAwcTFZTmV6bUpqa2RHUks1bW92RWUzR0lUdTZiNU1nS1pINk1xSWRnNy9z?=
 =?utf-8?B?alVkQXVtWmRpQkN4Kzk5ZzI0SjEwMnc3b2FxRGJkenVjNmwrYmF4Y1JnNHNX?=
 =?utf-8?B?ZVRObmMyVWFvRHZtM2FSQ0FudVFmcXNUNitoZlBqTXFZYmFSTGRXdUJ2ZnVT?=
 =?utf-8?B?NDZJVVlRRkZRSUExb0h5bTVWeVNTcHpCVDhTUUJmVU41bmdRcUZLUTdEajly?=
 =?utf-8?B?UDZkeC84Z1pVMDFtb0wybzVaWXNtL3ZqdEFsMGZHUGc5YW83b085aVplMlFp?=
 =?utf-8?B?bDhFRmJSUHNsMXQ5SjA3NDlxOTJwMGhJS1BmM1FZUmZNK245OHRKcUljZmYv?=
 =?utf-8?B?eHdKNVFacnlsUGNBVWlhaGxoRE93L1VGcG1hdk8rcGs4MVpsK0xDUmJpRGMv?=
 =?utf-8?B?dmk0R24yMHExZG42eGJrRlJkbmVtUG1LWXQ5OFQ0QVFsTndHR3hJSzVoR2NT?=
 =?utf-8?B?Y0hnM21GVThWSVdUT3lxSEZicmQzZmhLVDc5MU4wT1BZdkZtNXBCVU1hK0N6?=
 =?utf-8?B?cHFJRXFJdGZDalJNdzluTEVOYzJNU3g4REt1QUZ0S3NjekhXQk1SRkU2cVd0?=
 =?utf-8?B?U2YrOE4rYjZuRjNIeW04cGQ0WDFKWDRZSEhGZGRFaEtxUUZJeFl3alhXajNQ?=
 =?utf-8?B?ZTlqOWowNGFoT3ozcjNDazRNdkl3Y01VYThlSzYzRmNmMnM0M1YzSkxrQUhv?=
 =?utf-8?B?L1dDWDJYZ2V6eWRpQm41WlJGMTh5M0QvV3NBTHRBRnh5NzlRUTF3bjlKRXFV?=
 =?utf-8?B?WjZnTTBXRmpad3VPeGhHdURaYkNuM29BcytIck1pdWNNR0NHbytQQTNqcmRE?=
 =?utf-8?B?ODJYcFFwMTcwWENKNnVWWWkvZGFpUEpEakhldHdhVDEyS3l3dHRETXBrWGdZ?=
 =?utf-8?Q?LufWJq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDVwQmI4aVdmZ0FxSzF5S1JBa0dOL2ZYQVJWUThIS0V4TmpuMzN5b2hQNjBl?=
 =?utf-8?B?S3FJOFNLM3J1eGltOFNqdFc5L05OeG9QUVF4VjNsMlhEejE4OFJ6MW1pUXZL?=
 =?utf-8?B?MG4yT0Y2OE80NkhzdFR6V2kybkM4VVBCbjl4ekRoaXArUTRrUEJPbUoxelVJ?=
 =?utf-8?B?YlViTkdRajNvbnJzdkhRVS9wMUE0QU1BSTBENmRvLzIxM1BLcHNCNlE5a1BD?=
 =?utf-8?B?cG9jQytmVmFKWncyZFZSMm9IM2dxcll1ZlBSQTRvb2FRcklsTnVOWFdob3lR?=
 =?utf-8?B?eW9KRDhVaFgzTjJOMHJiQzBnTWYzV2puUnBSd01YanoyclBUVTRkV0tjcXQr?=
 =?utf-8?B?NUYzVHJYckhPYlFrL0IvV1ZoYnhYY0VILy80YzUvN1NKZ2lLVmQrUHZuN3lv?=
 =?utf-8?B?R3NQNHRMVlZhcTlXSUtQQ0RQQWxxRi9reWRGamtEN1ZUcHF5TWlzaThPZXZq?=
 =?utf-8?B?cVphM2QxSVNqaTBkb1dyS0F4STVncTJrSkJkYWZVQ0FBUzJ3aTdPbnptWFR4?=
 =?utf-8?B?L2Q4QTJBenErT21Md1lGVEprK1l5cFUwWk1DWDNvMlhFUWlvWUViUlV6Yjcy?=
 =?utf-8?B?N1NBVHRZSU4vby9sRjJsV3A3dVlCSG5vQ29MS0hpUlFJNnEzNXNGbVkrbkFL?=
 =?utf-8?B?SXJtVmdWd2xkenJ6dHRKSFg1bnV0WGdnM25UdnJSN1hwc2FhT1VKY0xPQ3Ro?=
 =?utf-8?B?VDUwaXc3c3NGUEhqVlZDNHNtbzhBQXJrOXFCOXI0bGtyRm0yT2FMMENUK0tX?=
 =?utf-8?B?ZlFOdWFaQk5INEN1M0pPZG5wQTJJa3VuZ3VHR1BWVHhBRlY3TmxzdjZGK2xu?=
 =?utf-8?B?dVpPKy9UazhxZ2xRRGZYOEJlRGExbkxmVGJKWDR6ZHpDUHhwSFlUYmxuMGtG?=
 =?utf-8?B?cU0xUDBlUUF4WCtjRXJmdGxmeEViL2MzelZVcURsRFJkSndmVHhjUSsxdmx0?=
 =?utf-8?B?RWpmV2gzRmZ5ZzFreTI2WlpiQmx3bEtsQUFSbmJLelYrc3VYb2tKc3ZiOVQ0?=
 =?utf-8?B?UmdNN3FROEd1UGQzK2NENlo5M29vejdUNnlSOXd1ZTE5a1RnRit6RWhXZTlW?=
 =?utf-8?B?YlNOL0dkWTZ0eGNERGdvdVIxY2l2ZEt2aEJONjVrYkUxY01SM0dZVHo0WWhu?=
 =?utf-8?B?NDJBU0xBRkxNM2tybkxDR1pTaUVnUXU1cjJMajU5QWtVbDFDVzB2Z3lyNnlW?=
 =?utf-8?B?U1BJckpTQ1FQTG93YnpWSTRRdXAzUU1TKzJRMDVmODloY0x0NUtXbHJqZGZU?=
 =?utf-8?B?VWZFam4yT1lsVUtuK1czNXcybWpRbkx0VGFqSUZGakhLUkxGSGhRUms0T1JP?=
 =?utf-8?B?RXZYbEJVOHVBc3hJSzRPNDNqZDlXWHdJcXlaRDhnZ1pUZVk5UmJHWUJ3bEIx?=
 =?utf-8?B?bVl2WVN5bFgvVUwzREgrd21VY0I2STZuRStUcmtqYVVvb0hISlZlRVhJcXlX?=
 =?utf-8?B?cEExNkRNR3pRRUczSjU4ZHJFeXVLY2NzYStiY2hObXA1TWFIN21jWG1kdCs2?=
 =?utf-8?B?cVhRSFgzZytIVi80R3pIbGtISG1Nam9LYUhncFZrcTl4eTUyNVVtRFl4M2Ur?=
 =?utf-8?B?T1k2VUEybGlMaytCdUtxK1ZNUmM1am1BdjNIR1U2d2RjUmx5c2RzTWxLNkNY?=
 =?utf-8?B?N1dyTC9OTjNSUm9CWlJ5dXNCd2RNMHQvQUYvNEcxb2RTU1lIUmFLcTFkNVlj?=
 =?utf-8?B?VkRsTzVnNDhuZTdtdU41YXpKbWhsc0NuaGhsS0c2OU16Q1pUa25rZnRzZVhm?=
 =?utf-8?B?NitMTk4vTU9YZGl4bHJIb0VvWEtoOWRXM1ZEbDUrMjNLd2VocTEwcFpSS2Jq?=
 =?utf-8?B?MWlRQXBsamlsRGpFQm11Rk5jM3NKbHF4NzJ2UGFLZndRdFYzRlRESTJZazJW?=
 =?utf-8?B?M0s5MUx5U2REZVBSdHE5N3NkaTY3N1JUR3RjMmQ5ZU5yMWpiR1Y1ditRNDhp?=
 =?utf-8?B?YTF2aWQwM2lsMVJQQ2YrSzNJRnNUUG5iNWpwZk1TNnptaTJWc09iWHFYelZT?=
 =?utf-8?B?ZFNIcUdiNENBc2MvN0Iycy95Tmw5cDdBazV3Mk41cWhxcjl6VjN6RGxaR2Fl?=
 =?utf-8?B?ZS8xckdlT2JLeEtXR2toRTh4b2J1MXdBTjI2OHgzNG1NSnRxcTEzWTc5RnFW?=
 =?utf-8?B?QlRFamdHck9ic1JhU3JjRzBDd1dQTFY5UmRzUHd3WUpiVUhlSGN3QlpvaWdG?=
 =?utf-8?B?dC9CbnBZRGt4bC90MGFuc1Z1OFZxUjRVL3g5Sng2SkpuekR5Nll4UmgwcGZp?=
 =?utf-8?B?VnR2aEFLWFBzV2RZbGl0YUFpbFh4M3F2c1pHQVBQNGE1NGcyaVo2R0ovWWFB?=
 =?utf-8?B?dnhGM2VUcnlrVlhmZXdLaE9EZXBMdUo0UTlpeXYvV0Y3SmRTczR1UjRXMnl4?=
 =?utf-8?Q?P1mTwWI3X6Kv5mPfDFJkHvFePxQ/v+ZqHBYWb?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a9ab6d-b2d5-48af-f9b0-08de5e8cec3d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:47:28.5896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7tNwG0csFxnDx6WF69VedjgZYYKEthdQ0E5dFnMfQRgRHa147VU4T1wDnE1CByLySV2C5p8STn5gCTpQZtyDmhY7g0jbBbbYqsuwNqBDfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 16:47:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8779

Hi Robert,

On 1/8/26 5:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Wed, 7 Jan 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 1/7/26 2:05 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>>     one more pedantic observation about append files and corresponding
>>> recipe files. occasionally, one runs across an unversioned recipe file
>>> for which some other layer has an unversioned bbappend file, one
>>> example being the "mesa" recipe:
>>>
>>> $ find . -name "mesa.bb*"
>>> ./meta-raspberrypi/recipes-graphics/mesa/mesa.bbappend
>>> ./meta-freescale/recipes-graphics/mesa/mesa.bbappend
>>> ./openembedded-core/meta/recipes-graphics/mesa/mesa.bb
>>> $
>>>
>>>     so what is the rule here? if a recipe file is unversioned, then the
>>> append file for it must also be unversioned to match? what if the mesa
>>> recipe were suddenly to become versioned? would that append file still
>>> be applied? the docs don't seem to cover this possibility.
>>>
>>
>> Can you try and report to us?
>>
>> - does mesa_%.bbappend apply to mesa.bb
>> - does mesa.bbappend apply to mesa_git.bb
>>

No to both.

>> Considering mesa.bbappend applies to mesa.bb, we should update
>> https://docs.yoctoproject.org/dev-manual/layers.html#appending-other-layers-metadata-with-your-layer
>> to mention that recipes without a version in their name can also have their
>> own bbappend following the same naming scheme.
>>
>> I know that u-boot%.bappend also applies to multiple u-boot recipes, see
>> https://git.yoctoproject.org/meta-rockchip/commit/?id=ebfc42663d52f2247b7de5d6267b353887cc2d91.
>>
>> It'd be nice to check (and document) whether mesa%.bbappend applies to
>> mesa-foo.bb, mesa-foo_git.bb.
> 
>    i'll find some time this weekend to test the above, but is it
> reasonable to ask how this feature *should* behave with unversioned
> recipe and bbappend files?
> 

Well, one needs to read the code to know how it should behave :) I 
didn't know so I went checking.

lib/bb/cooker.py in bitbake is where the magic happens, specifically in 
the get_file_appends() method.

       def get_file_appends(self, fn):
           """
           Returns a list of .bbappend files to apply to fn
           """
           filelist = []
           f = os.path.basename(fn)
           for b in self.bbappends:
               (bbappend, filename) = b
              if (bbappend == f) or ('%' in bbappend and 
bbappend.startswith(f[:bbappend.index('%')])):
                   filelist.append(filename)
           return tuple(filelist)

Either an exact match (bbappend == f) or a partial match with everything 
before the % character. Note that bbappend is actually the bbappend 
filename *without* "append" at the end, so e.g. mesa.bbappend ends up 
being bbappend = mesa.bb and filename = /path/to/mesa.bbappend.

Pretty simple actually, so I'll get going and add that to the BitBake 
docs somewhere :)

Cheers,
Quentin


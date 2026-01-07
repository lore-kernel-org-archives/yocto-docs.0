Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC0CCFD629
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:06:15 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5226.1767791165005064645
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dh2CksME;
 spf=pass (domain: cherry.de, ip: 52.101.70.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frkVdrlTEGMiF1NNLWkliXt9FHZEMeeQu1NbuR8aZcDdQqGwnPBo0Xxcx/XmOC/e78wF9CykYIOGDkcFnesXljq+bqfUlEsHuzkvp+p0ieH5gmXsn2sEQ5FeVhQzyv5SZlnsZYq1Aqd3qsEsVpL/ZifYUVzmmpy+fWTkCvJdqdwr4DLJu4tIp9ui5xUOLLsV+F/z3RRIC1+zeORsz2IkWSiqhkCEl63dia1GT30lWsNi9GyoQiegraDkL4Tuq2jKDLF3pOOzkFzkxGTI+jyG/i9IRCv1oK18fw0hJhlavKSs4om9BQX7/AesZ4VNEoUf4HgrioEMj5+xNNrCcC392Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fxbNwLgQd0pIdPKyojg+ewUsq1zyTDvfDQAptEd784=;
 b=iGCPzGyR+EXJklUZMdx5SPM7VboaIXSpJxm7MUKBdpPHuP4Zm9aqtcVSQG7/V4K6sVbIjsw7GOardLdBABl4lPmiucNKyvtb79G7eWwR9I8CeSlb6niyxt4lZHZEjpK/mqIiXEsGKGmMb2ClrB77xqlMEc6ZPAbw/HM3OdLOuf5vyGV7vJ7kWYpcrFwa7TKQYnbcH11cKtzxIUoqemZU4bT3TgP/Ug+eUODEIUH8ASD3Q+dzfB8Vz7giT1EbV09xQGJqAeWqrMYqmycwoW+sJK0meh5hv/7k3T8374pBtNGhRzB1nrW8nidYBsG8P+0xNqxxi/XFiAOA7i4fk6ELWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fxbNwLgQd0pIdPKyojg+ewUsq1zyTDvfDQAptEd784=;
 b=dh2CksMEMse+rE4nhUSyxHpmeM1El7ZUSAkdmvJ/+fQMfcRmCQNEjC4v4S3XQf7+YmmhQ7HBPSGifRWIt/t39lkQyU0GYhJIgF5QeBeRB4X+w+GvlfKrmFAkMs48KF9qMJsX7Csvpx3mLsiRpzTDR4gutlQ6czsLV+Uv5qK1rMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 13:06:00 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 13:06:00 +0000
Message-ID: <4f795aef-9432-448d-a21f-e1be7b09768e@cherry.de>
Date: Wed, 7 Jan 2026 14:05:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] should YP docs host_packages_scripts have symlinks for
 debian?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <64f61085-723b-70d5-a019-f11c02e8c8b2@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <64f61085-723b-70d5-a019-f11c02e8c8b2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: c40df037-3638-4220-1981-08de4ded8136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1V2VUtWSERQb0lZSWxMRytWcVVNZHZhTFdQMnZmZm9HbnZHYStsbFU1QmVo?=
 =?utf-8?B?QU40cVU4MFR1SVFVWVRMZVRUcHJKazNZTURkU1pCZGlkN3k2NEI0TTg1Q0Ru?=
 =?utf-8?B?eVo1MWEwYXk4MUJ3Q01zd2pMTll1RSs4L3RILzB1UCtlcTBFUGEwRzNic0Q3?=
 =?utf-8?B?VHV4Mk1nZWtKS0dsTlpuU0kyMmNGRkJUOHgrd0JFRmZLbGptM2ZsRGpJZ0JY?=
 =?utf-8?B?NVg0Uk1CVjgweHg1MDBLS3J0Ryt5Z2xSN201Y2xCSnorMUgwdDd1OVRwVk9C?=
 =?utf-8?B?aW9wZ3B4dVZWcjd0azNwZGNYSjkxVW5VNEdoWE9FSndqeWZuOFNrOWNETDhN?=
 =?utf-8?B?Sm9JMkxvaU02OGVvUFp1aXdWOU14YTR4YWRDeDJwcEk2VGlVSnJta0dKdG5P?=
 =?utf-8?B?YWtLcUFwRmJBUGhHMm1MSWxZY3JIcFBQcjRBaUF1dm4wemZuY1dyWTlpeEh5?=
 =?utf-8?B?RGh1K2EwVUZBSDZHOUdNWkQ4bU1vUFJ2cDJPT0sxM2t1WWF1RzExM2c2TTZI?=
 =?utf-8?B?NG52bzd0ZzlqSmxyWWFYMVd0eWtYankvdkg5UUxOalc1VTNxWkFaaTJKQ1Z6?=
 =?utf-8?B?dWthMDgyWktQRVNBZTc4MzcrVGNPR1Zkc0RrUkwrTk9ydWFuSjRnc1FJWmdu?=
 =?utf-8?B?aldlR1AyeE9TbHd1SHpOakZLRWRITG15Q0I2Y0g4TllwZ1R5STlUd1J0Rk1m?=
 =?utf-8?B?dHdVZFBkVXdNZWEzbmNYRmVFMHIrYTVTRjVTV0YwT2NaT3JteFRJYVdBU0hC?=
 =?utf-8?B?K2Z1UGQydTJLVDQ1R1pNNEdBOXZid3IvWFBnN2tBaG1oV3JiekxuNks3MkFs?=
 =?utf-8?B?N0pUUzlQK1R6T3ZndGx4bWtKU1B6Q0IxV3R6d0FBK2dvQVJJWGw2UEdVVThL?=
 =?utf-8?B?WW5sSlhZVDZYT3M4TnYzNjJqblY1Vk1NamhLeHhJVFl2ZWRFbVE1cUhEN1A4?=
 =?utf-8?B?UWp6VkYveUlUMTU5ZEgreGhIQkVuaDFpZndZT21Iemc0WU00WUc3cldVZDZN?=
 =?utf-8?B?RnpVUUVrV1VpbU1yR2NLN29wODMvanlpMmkzSGZyaVg1ZnExTTAyQi9kYzF4?=
 =?utf-8?B?R0hsVWRIeWtWcmtoMlNmb3VOOGhHQklUVlJ4U3JSWGx4U21xaUs1WUk3dXVp?=
 =?utf-8?B?WHRYWjVLSFF5OXJ5MlRnZXI0bWUyZ1BMdXJEdXZKWEIxZ0Fuc0tGMUZJYlA5?=
 =?utf-8?B?V0ZqK0krUm1vTDlkNWtJMiswVHBCQjhab3ovcWFCbjhpVGRLeGt1VEJ0Y0xR?=
 =?utf-8?B?Q2J4eE9GQW1Bd2lGUWJlZU5GTlk0YWxlNXZqNVJIZGZOWHhyc3JYRGRYYldS?=
 =?utf-8?B?RFhPZjlibE5CMm4zZFlHRXZIQU9IYjU3WUNZSk9hT0NxemNqR0lDVjlGZjV6?=
 =?utf-8?B?bEx5TWxqZlNsVU9FeTlRRUZhQVZkckpyS0ZPMmZSNzZpV2h6Q3BaN1FUd2d0?=
 =?utf-8?B?U2hjM0RHWE04em5VcFhqUDQ3aVVDUklzUGNRek42V2hVVzRRYkdyQ1d1MGxI?=
 =?utf-8?B?SjRjNkhDditPdjRqdGYvOTBORTlXcllCVm1IbkdnRk5Pb011WGhWc2hITFV6?=
 =?utf-8?B?ZXZUVGJ4MWlkWTRVelhiMTZ4OXlsbE03WUROUXJBbHpqZ2pNSHo2cnJwKytB?=
 =?utf-8?B?SlZuaCtiWVQ3R3E5VHdidmhxa0FETm44ckMrWlVCWXlZNFltVEkvWGQ2NnRj?=
 =?utf-8?B?dXY5akQwR0dScmFvZERQL3FDYkxkL2xBbWNGTlptVFlBbytWSmhTQ2tobUll?=
 =?utf-8?B?TC9YeVl5UXNwbEx6ZDR5MHE0c0dkS0ZsOFZvTm9kNTlKUGtPOWVPR3piSVZ4?=
 =?utf-8?B?ZWlMdWRMMGNmSHdDTzAyeGNyekdIeFVjeUFWN0lkTjAzQkZJVTZHeG9zRmsr?=
 =?utf-8?B?cUVLYmNzUHE3c1pkMFlPdyt4SHdmRGhhZXI3SjcyR1lqaGlYRjA1NE9UbG5L?=
 =?utf-8?B?Wk9DUmZqOWVOdGFobWx2VExUQ2tFVms1dUNmMmltTnVvTFFkRSsxMWNJdXJm?=
 =?utf-8?B?elVSd1RJUHl3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlFzU1RlLzVZRGFPeU5zYmZmOUE4T1FJUnVFZHgrNkpsTTBlMS9jcmR4VjRC?=
 =?utf-8?B?RGoxYWpUbmpIVnBvRExRWVVNVTAzenIrYU9rNzFZR2ZJaEcxcWJSSUZZNHNI?=
 =?utf-8?B?enBOY24yWk1SdkFMNWFxVGV6NTQrUFZGSWJ5Y2paSDFZYUFwZVhIa1dHSmdE?=
 =?utf-8?B?c1FvaXV3c0lOcTJQMG9MSCtOY21jcHQ4SEs3Sll0RGpES2syVS9CSkorMUFu?=
 =?utf-8?B?enh2WjVzL3BuT1VrQkVnOG5lemlXdzc4REFkUVlxRjljcXZYK0xKU3B3N0hC?=
 =?utf-8?B?bXlJMElnM0JSNmV5amx6d2Nmd05PRlBQQTAyN0ZSQzFoTVlIVnRmYVpFRTR6?=
 =?utf-8?B?RG9UdER1ODhmN1JFYTV6UXhONm1lTmF1VGNYZFgvaGJ0QU5SanNZamh3eXBE?=
 =?utf-8?B?VmkvNGJNR1R2dDBZK0tMM25GeVJ0b2JTbnVCTHd1ZWprT1FUOEdlV3NPMUl4?=
 =?utf-8?B?azZFcURZb3AzOFhNVldiZXdkR3FyTWxtR2hRTVZFUVNua2c3eDRMbW40cjZL?=
 =?utf-8?B?THoyNndxaDc5K1BVZUJKdk9NZ2pHQUJaSHJEeEVmd0pTS3RVcGdkZGRtNHRy?=
 =?utf-8?B?UWt5Sk1oRDZWaGJQSDNjelZDZm9rWTNHN1VTd1kzUFFHU1hZMmYxck43NlpL?=
 =?utf-8?B?SEh5d3BQYkNmS3hWTW9zVEh3K3dsand3azRZWWlXZnhTUktvUHpMMWo2SGZZ?=
 =?utf-8?B?dHoyODFzVDE3dllXcW5KdGJYY3dNZW9WVHR6d3VWdUlpT2Q0TUJxZGlnb001?=
 =?utf-8?B?bkM3d1RxRlVkb1Q0NkdsRHFrZWtxVzdKT293QlJibFM2QlNHOWdGWnFzNmll?=
 =?utf-8?B?VVlpY1VBbkdyeDk2cytTakFBK3JuVkZmbTc4SFFNMDRaS0Y0Mk1mMTkzUVZt?=
 =?utf-8?B?K1p6WFdIQnc0d2NNeHZQdzR5M28vTGRqLzVNY0o5blpQSHV1bU9jbWhuMklX?=
 =?utf-8?B?TnI5YmVnOWNyTjNIWUxmRzJESFMwc3pMMW1zYW40NnkwTUE3Z1NLQXExeGd6?=
 =?utf-8?B?ZnY1Y1VHLzVsM01tN1FyQnlGaGliZkhSQkIrS1lidFlEZkZNZ3N6VDhrWlpv?=
 =?utf-8?B?NFQ0d3dMa3FWVjVTaFVlS1RHTEF0Ym9FUXRkZGUzektWTmxld3VVaVQyN1pM?=
 =?utf-8?B?dFJoOTRWNFNmbTczL3FjckNNOWlPZzdBQXZMN0RyZUxMWVpjRkRWS1hhb01N?=
 =?utf-8?B?clZPRUNQRXF2ZktuK3I3bjl2a0xEdGNoKzRIOXNSUHdVNTNLa0dqRytCK282?=
 =?utf-8?B?NEV1RUpza2ZCVHp6alhhNWFVTkJIbEZ5MEd6bjBjdUhCQ3hDaGxNSlZaYmtk?=
 =?utf-8?B?TXpFOEpNaFNOVjdkK2FvYXJTblBtWDFzL09ubFIrWjFNSWRRUGo3N3lBc1dM?=
 =?utf-8?B?K1JNVTc5WHZ4MWwzdlpMMDhwUE1SNjY3NU1mTXdyNHF5MUhnK211YTZySlQw?=
 =?utf-8?B?K2U5WE5rNG9VenM4d3JVRnVyRkN0Qk1PMC9WaVJnanNMWmdhV2R0S1MzTk9L?=
 =?utf-8?B?amdIL3hFOThXMGdsQ3l0cUQxcmNlemtBZnZGaVBQV0ZscjNqWFRMdTYxNk9q?=
 =?utf-8?B?a0tSS0lxeHNUMS84OUE0dHVqazBnRWtKNzd2SE1wUnUvd0ZtUW5Qc29QWlU0?=
 =?utf-8?B?TnppWkxFaVp0QkRKN21MUU54cHZiQncvZjAxUjl5aEJzZ1JjVGlWUUpsa1kw?=
 =?utf-8?B?UTBVa0hOQWNjTTVrTkVPMk1OczBHNEExcnRGRG1ZOHdmWkRwQUFEOU1CQlM3?=
 =?utf-8?B?ZjN4dXowRXdka2Vad1NoL3d4VFQrVWozZFRmdmdtREFXelEzYkYvQXk4Ykpl?=
 =?utf-8?B?WTBHVDNhUTVERmNwOWVXMGM4LzhwdW9EZkovNS9wNWRIeWFsb1ZSRmxlUk40?=
 =?utf-8?B?SzJ0anIvODRJd1JsSlFaK01UalIrc1Y3KzlXbmtwWGZURTJWQkMvV0dwa0FZ?=
 =?utf-8?B?ZWNxbjFGTmc3aGZEcWJRTmJES2pkTUdRSENBem5XWmRUUmFEL0xYd2wwRk1n?=
 =?utf-8?B?bFZ5UnJDanlURDJORGVNMERSQ2QrVjdCaGpmdDFKWUN1c05lS2MzY2N1b0pv?=
 =?utf-8?B?clRMamE2NjVBckVIVmhYK2VvK1BvdjQzTWp6ckVUS1FpeFRvK1dPa3lIWlEr?=
 =?utf-8?B?b1BudHIzOEtBNFlIZVRUdTVxQi8rZytyenArVEF3N2dWMURGaS93KzMxais1?=
 =?utf-8?B?Z1d6c0lNMVJwNTEvQjJaQm9YTnRjOEE3NXQ2UXBHeHUzUnlxb3YrTkZja2ZH?=
 =?utf-8?B?L3VHVENLUkUxVTRqdVl1K3Zudmpod1NBQXFKLy9OS25NeDdSZFJia29ZMkMr?=
 =?utf-8?B?azF0THZxS0Y5c2hXRGlDZE1OODlGNzNWNG1aRGtNRXE4QmNWcGxNZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c40df037-3638-4220-1981-08de4ded8136
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 13:06:00.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SbH/jHCAjDlRpZtKN4RvWQOcUXhztZovKwbnKT77jKNxCt1AzzDgGpCfs9whzbJBLqq36yvv+efVnEcgld8O6k2Aat9JnmXQ5YfAPtW9Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:06:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8404

Hi Robert,

On 1/6/26 9:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i noticed when updating my yocto-docs checkout and trying to build
> on debian 13 that i was missing the debian package
> python3-sphinx-copybutton. fair enough, but in the
> host_packages_scripts directory:
> 
> https://git.yoctoproject.org/yocto-docs/tree/documentation/tools/host_packages_scripts
> 
> there is no explicit debian_docs.sh script, while there are symlinks
> for other distros to cover the bases.
> 
>    would it make sense for there to be actual debian-flavoured host
> package scripts, and symlinks for debian-derived distros? so the
> debian scripts would be the *actual* scripts, and the ubuntu versions
> would be symlinks? for consistency.
> 

Well... The thing is that each separate file is included by the docs for 
the respective distro installation steps. Ubuntu and Debian share the 
same instructions so they share the same file.

The files in documentation/tools aren't really for outside consumption. 
Check from the docs directly (where the instructions would be there and 
if outdated must be updated) or use the container for building the docs 
(documentation/tools/build-docs-container <container-image> <make 
command>, which use the proper file automatically).

Cheers,
Quentin


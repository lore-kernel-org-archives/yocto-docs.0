Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D356ECCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:36:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.16])
 by mx.groups.io with SMTP id smtpd.web01.3554.1761734182389900501
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BP4e3EqU;
 spf=pass (domain: cherry.de, ip: 40.107.162.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhSRfDQz6182QEvMeAut5XDdl7LGtXRSN0Ie6bsxcxMGEfA2XBgsit8nA3EkUqGQRi4kHWU0TvNQOgTHdXoSTzmqfRttrAVtG4fOSGXHmMGd3uwZFqcvgxuSpfR4X/4rQ2E5lJdjgB3DhB+X4kA3b6IxvFJ4rkuHaGjd+0+JPmN8FjDg7MtMuRY4GirOWZb0CTCfhkbkbrnr3ChMPXGSeZ6qV0lJDmsQ8tKkEzrrx9CiUxrjk5HHY5CGlRlrZVKhTdIWqWpfQp6GqHNyqvNnc6rX5jK10m3ivyGN0mN1NM3wGoNwlxpKo5xdr683Vf0BWRffJhZS2zx3n0ailVMKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=givehLQgWPGXAx9fgWxU5jQy3irvVCn3ligTu8dwT20=;
 b=T+q122sojh5rVc7dJJAFkJXRYA/9VahsPC3ETOJvcYIVV3QmCqDuRCWfZecHUT9uAjzJ5J5RItbRfo38AXgj2aL047DvsMGBj+QhtuGEQkQeh0ey8HnmPpPNreNejDYN4bIGhsApqy9jIOylPuBEpF6SlTUxTiRxnnbtyMgxj9G+yM0OsbVVqEbM1cG9OY9lRmQp0plKSr9CMgknflgdedTj7ObwiiTADAwZpKwSDcdYfIFp5hAgh4AZSuApBdOmlpSHslOCsqRNaEhOZjKJUbxD0lGEl7vuM4FahAP/xr5uqLyR6C+on4BKl2MpnR4TpaZzWxMZjzHmngfuFf33+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=givehLQgWPGXAx9fgWxU5jQy3irvVCn3ligTu8dwT20=;
 b=BP4e3EqU1LMZXl5Z4XhyDGAFyeAdu3+G1g976cvLuQQkijj/ol5PYJuzGrK5PzsWtsORmk5ru/d9bt3jElOZWJGik0lIgsnamKmGYui8uSXklF/Ahm54RKNBhSD9fiqGo0eFyqCCOTWW/Y7KyDmbAopDZCoHAeVub0QFjCv0Eeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 10:36:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 10:36:18 +0000
Message-ID: <219f6279-799e-4ba5-959d-37bba26d293b@cherry.de>
Date: Wed, 29 Oct 2025 11:36:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/new-recipe.rst: replace 'bitbake -e'
 with 'bitbake-getvar'
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 721bc3b1-268a-4d06-8ba0-08de16d6fe99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmlsUFZ6SXNkQU5UT1VUOFZ5M1RMSjNVQXFoeTdLdUgwaFBjV0xyM0hVNmJk?=
 =?utf-8?B?T0NmTGt0YVlxOStpQWR6bWhhWjBkRkVNeDY2T3IyV2FaSk05UDV3Szd6Q3Vo?=
 =?utf-8?B?M1NEV1Y0Vmh6Q3MzaFM3SmYxeFVSNEYvVTlxUEFnMU1sclI4MTU4N2U4S1BB?=
 =?utf-8?B?SG40Qk9DMTZia05RKzNnWE9lcHprWFJjWDludG5ScWRSbHlNNDd6ZWtscnMz?=
 =?utf-8?B?emdIdHZadHRCTngydzRreVJ4TjdoKzh6dU1KVmV4Y01SeXU3K1FhMC9HRTFz?=
 =?utf-8?B?cXA4TG10aGRRVk5CTnN2VlFsVHYzU3NsL1k0ZFoxRWhTa0YzbTVLSW5hL3pE?=
 =?utf-8?B?b1RYVmNvak01YThPL1JNVnU3aXdNZnZhRVkyd0VwVzN0cFJacVkrRk8xaUh3?=
 =?utf-8?B?NlI5WWtWcmwxT3hPb21OTHp5c2FsUHF4Q2Y3M3AxK0lqNDZaaE5sMEpoY1g0?=
 =?utf-8?B?bXB3WnZhdEJ4aG5kb0NINnBTei9TOHFDeE82T0R4QWh0RGNFMDdGUEZILzR2?=
 =?utf-8?B?ZzJoK0JyRlkwV3BBRS9PMW9KL2dkZlB0ZGdEbEJZRCthUkh2WXorSTk3L0c2?=
 =?utf-8?B?QzQ1bDlJd0EraHVob3lJaWNNZEVNRUUyV1dEMENraHZYNUhkZDlodzBSczlM?=
 =?utf-8?B?dy9SanhzL3gxc2YzY3lnMzNLWEpiUTRQbjlTcEJDOU0ydVRxK1B4ZUVRMjN5?=
 =?utf-8?B?SGM2eFlaU0FsSnhWNXNUenZxdnlKLzFyUnVET0VCcXplcjR4WTVHRk4zdEE1?=
 =?utf-8?B?WU1JZUo3dTVLdTRjcjhFa1BSbTNCb2Q1a2lZTWtkdy82anZYYzBOYlZUWkZm?=
 =?utf-8?B?RlNXUk0rL1NOZmx4Z25FaU15YnU0TGE2bnFPMEdYK3FGQUJwcWlqbUtSamVT?=
 =?utf-8?B?L3VhMGt4YlVpR0E4c0xEcHd2dzNPUk9VMTkvVENVZW5RYW55R0J6TnkxZEhu?=
 =?utf-8?B?SEZLbHRsaFQ0eXlWaWYzWDZ1aXZSUkdNekpMaWhjLzA2VG8yV3J0NWVUNFVp?=
 =?utf-8?B?RWVNOW0xTzJ5d01xa2R5MVZOZFhVT3JmYSt5Y3NWNEtZbVZTMFBuOHlHTFox?=
 =?utf-8?B?dzhPSThJeFZiZ3RPK1d3VURta2lhOXFmZFVucU4xcXJmMmRsbXhxcFdVczBo?=
 =?utf-8?B?N0JiQitnZGlITHhnc3dLVUtTdEFlTVd1KysxOVV4OUN3MmZrM0FVekpKbGFQ?=
 =?utf-8?B?SFhHcEw1ckpKZ1pYa1hGZGdWUHc0RHR2dXAxU3VBNFY1VTR5NkRwT2IwQUM0?=
 =?utf-8?B?UmJNdEdtdDNSYXlpL1lBNU1XNThvTlVrc1ZNNGlQeEMwK2VFMkpUOHFxSHBs?=
 =?utf-8?B?MDAzSUUyRHBlZzV0TG1LdVBkQ3dOZUZtSDRUVmNHcGJDKzQ0QTBxZEdxdHVm?=
 =?utf-8?B?Ym44dmg2NitrVmxUUDFvM1NEUXRZcWxrenlLRCtrMzhZN2NEckNWb1piclNJ?=
 =?utf-8?B?TDVlUlZCME9ZMWxzcHJueVRnMnp4YTdxRjVvclVRVFdSSXhyZ3lmUmVzTTAz?=
 =?utf-8?B?Zk13c2RxQ3hhK1BDL2VBNkduUXcwSXhaaXZuRXp3MDNvZDVHWkxqd2xTWDND?=
 =?utf-8?B?SGsyME1UeHBQVkRkYS9CRG1iSFJxOEpKYmp1K3k5TUQ3UW1UTlAxK2RHOUFP?=
 =?utf-8?B?elp1S2dndGlacmRuVDlVZDlZYW9VVTc1ZlNNRFJNWURvNlEyVnQvQTBhbG9a?=
 =?utf-8?B?WnJnZ3hvdkl2SDVVT0tkKzduNXp3bW80MmVlVGRvKzQ2eCtNbG5hbGF5SmVI?=
 =?utf-8?B?T0huM25uZy9ZUHcxaEkrSEd4Y21YWUlwWXdkTDMzK0lSWk1rS3cxL2hteVdl?=
 =?utf-8?B?ODl2SVNkR05JM3hOTCt2ZHNIelEzNW92Y2tNTVh4ZWk4Z3lyTzJOaFZoTEcw?=
 =?utf-8?B?SVJSY1BXY016YWN5aVZJaXVKTEhnWG5DemUrT0Z0K21qWlJqejdyYXJ5KzBB?=
 =?utf-8?Q?ov6/oJN/4tqVmb3/JHtYYQZhfohmRU2i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlVwU2h6bUgxWkFjQStRL09nRWs3clRJYmc4enRFeUhDM1pPMHlwZUxjemVL?=
 =?utf-8?B?RDZDV1FrY0NpTUJOcng3OHF2MHdzSG95M1ZyYXNTc2plSCtHWllyOVBNRWk0?=
 =?utf-8?B?b3puVHdrNlRZZTlGaE4xbWxiNktLeUdNMDhTbmthenZ4emtYTGY0MHd5ckVu?=
 =?utf-8?B?VHRkVFQxYzdHSDA3V0hWaVhJRFB0allyUTd0WWUvOFE5TFY3bys1WVNNWVRR?=
 =?utf-8?B?UnEzbXFjaThlN2NpeTZUWFZIOHk0SUhvaU8xY1VhMlhORGFjdklhRk0ra09M?=
 =?utf-8?B?VzBYcExxcVpzSFBnTHNDQkQzVk12dFNSUFBKWUNVUFo3NWxQUmpjZ1NHV3BE?=
 =?utf-8?B?NmpEaFlsT0xCMkNOVmlETWFPcWt1VXNuM3JJd3ZPYVh6QnJqQzFUMi8vMEJs?=
 =?utf-8?B?TFhzNlZqWUNhQXlSNVQzUUtKN0c4VDJ5aUUyYXFtdzlUZFBBR1EzNmlEODQ0?=
 =?utf-8?B?eTNJNDAvQTNSUi9iem5kTkFHa1YvbExxcXVrb3ZMejFBZHJSRTNXSUpZWDNh?=
 =?utf-8?B?Wm8xeWRGR3hKTE5hQ2FVTWNMMlVjSGZVYnYwWVpIdVN0YlhkUlo2bk1pOE9W?=
 =?utf-8?B?WDV1ZlZNZjhCeFhRdXE5eWlFT0VLYzM5NTV4bzZKL2RGTUJsNmtBN1JiTFho?=
 =?utf-8?B?V3FBVWRCcmMxSlc2RGN6cFFzUk9IaDI2VjgrNXJUT3VtcldMR0lFbklHc2VR?=
 =?utf-8?B?c3RTZlpUYjMweUxEUUpCSmkwMmlUU1R3T3BxS2JUYU4waVdHVWRXcTdrcXFG?=
 =?utf-8?B?VTZJTXNSS242QWtYUDR0NmwrM3RQeG1DOWJJKzdkeXVRUHdUY3ltSW5PTVBa?=
 =?utf-8?B?Y2M3aXJxZVdJeWpoTGpNbHI2WG16YlBFbVJ3T0tSV3RjTDI3OFlPT0lEYi9I?=
 =?utf-8?B?Q3NFQTN4bmtra0d5SGI0VkI0VGtORVhzK1JGanVmQ1YydmpNZDZLQVl4UE1F?=
 =?utf-8?B?VDZ4Si9VU0x0ZzNPdExadmcwaXlJdEIrY3ZuV2Y0RUVTVXgvUFA1RWxFWHNG?=
 =?utf-8?B?M1VPN09tdHI2VnlleUxvNlZHMTJpUDZlaS9oNkpPb0ZGV2RiQm5YRnVWR0dJ?=
 =?utf-8?B?NzVvZ3RwOE9iUDJUZXRMUkRUUjJpSDJ0by9wZVdsRnVnTStleC9KQlIxeWJW?=
 =?utf-8?B?K3RTREdScVd6RVlWV0RZdnhxd3B0eWo3OERBbC95SXVZRHRCcTBxR01Wb0Jo?=
 =?utf-8?B?SCtzNFd6L2J1TVVvTm5wUzRuU1FkaXlYVWhpY2g0cXlXUldUVU1lTTE0dlV6?=
 =?utf-8?B?OSsxbk5xV2hhRW5pYlV4Y2VEd01TWWxlVDJhUzZPUnUzMGMwYWNwMHljc2Rm?=
 =?utf-8?B?RktGUnFHcjZFUTA0cUs2ZTRlelVMeFdScEZGbFpSVlI0NUlCNGR1bXJ6QXVv?=
 =?utf-8?B?SDluU2kyRlBWbmJpRXp4WTUvQ3RLZDhrdzVvQU96Q0lkemFna2tMUTZKWFNV?=
 =?utf-8?B?MmJpZ0RxREc1Z2MreFFic1k0a2RVWExqMTQxMEhyY2Vwa1V0SFZZellacXFC?=
 =?utf-8?B?cDRjc2xNMGJ4cC9MQStPNUVFSXVZUGNLMTNyVmU4a0FNdzNRN2hiaTVrTWFX?=
 =?utf-8?B?WVhXU1I1YlhJMkpaQmxSUm1tZWdpaEJ3VXlqRDhxZVcvRWdVZnAyMlpMRUc4?=
 =?utf-8?B?bk9SYVo2SDIyYVJmaCtRMDc3SWFibG1HT0ZYTUIyR0MwaVRiRkxrQldReG92?=
 =?utf-8?B?M0ZmUEJyYW9HZjlYbk5EWnhBR1V6alEwWVVsU0RsamZkM1haTmRTUndDYy9k?=
 =?utf-8?B?cUlBOEtNY3V4NGZKQllCN2pBUjhGdjFQZlhvSkUzSS9aV0hCL1k0a3RxL0Za?=
 =?utf-8?B?emVsazVyR1pzRU9uK3VMSlhsTHduMGoyMXlPV1Q5TktibWVkNlhEQmE2d09G?=
 =?utf-8?B?a2U1VHJCbWd0MjVrWVg5cmtZMGpkREJlOWpuakhPRE13V2t3NVRseE8xNmhC?=
 =?utf-8?B?M09UZ1ZWbkZHZnBGVHhORWFJVU82SHlPUG13SUkwZ3ZSV0ovemJZSmtDMTNM?=
 =?utf-8?B?RWNNelluVnNMMThQV0hrSkw1ZTVnQVVHNGh2eWMyZTBoekpGL0lhNnhyOTJu?=
 =?utf-8?B?MEJlcGc3cWVZcDQyc0tQT2Q0cW5yTlI5dnN5eDBRNlgyTHEzTXlaTG9pRE5D?=
 =?utf-8?B?L3Y2OVBMaFVYTXM5TnBVN3cwN2ZPelRzRW5kQW00b2JZQ1MwM2hxRzFqczNF?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 721bc3b1-268a-4d06-8ba0-08de16d6fe99
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:36:18.6125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S73ap/WMckuEmurytGsDdemnLljf4UPSAHj3l8AF0yTyPXz19e9wx8cCDpGP0r+BNF17vpMFdv6F03BsFEmyjhXyNUcNGzcHGnIZXrZdx70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:36:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7897

Hi Robert,

On 10/29/25 11:29 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Replace the legacy call to 'bitbake -e' to get the value of a recipe's
> variable with the newer call to 'bitbake-getvar'.
> 

It'd be nice if we could catch all instances of `bitbake -e` we can 
replace and fix them.

documentation/kernel-dev/common.rst has one we should be able to get rid of.

Ditto for documentation/ref-manual/variables.rst (OVERRIDES) and 
documentation/dev-manual/debugging.rst.

One thing I'm not sure bitbake-getvar does is show functions? I vaguely 
remember finding something in bitbake -e output helpful for recipe 
functions, but it's been a long time :)

Anyway, this change is fine so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


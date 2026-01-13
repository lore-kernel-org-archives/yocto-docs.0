Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA00D2F322
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:12:03 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61010.1768317122666768639
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Lxdcyxgt;
 spf=pass (domain: cherry.de, ip: 52.101.69.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhSdROfivIHIHatL6rQbPPa4KRq1oCmBY0U532x3uEoWWnVbAmPXMj2hxiK+PjpRN5ZTHeFv/56CIPbIGcxSC5hdeXpwV2xQMy+MIpt3wze/cVu/ffHYUuObZ8tYYE6c0FPaztJx+1EUi++io2ThgOuAgKVx8bH8Jn2uWSS3tbOLZA1PurKmbMs2NhwFlzBpjVO4awqCBkBHr4nBG0MJ/yfuxhduhb7ge6Ag0ed6Aoh1BNNcm6iorJWDJmcILW/hXA+TOus4tAN9xWrcWaikCjtXikcxC5mEsqkiUB/db7fWKCXLwnZFzVYartFise8PBoqOyzLwQ81bzrM+g6oBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiYkQMPW4LLjzzIZpVjqtc1nsWS8h4p2t9snjapu0iw=;
 b=jYK+G7fPdFf7SU063cyNNFb+GbLjFJY5LxhKqU08F4+/SPlcVInJHsmFcLNUrILkKiEp1OcHUiA+IFKRgnIYsQAh2gIEaomtbjIo49h/C6X+mga7zCkSr2qmQeos8GpnzgS8foW7WIsTMBNKdHRJJV7xe7Qg9wT/EQrR1vT21lEmSeLhy3kvZhWiUczJ0RzoAeJdZjm0kSdDFZvdL0RC2HjO5wv4/51XYBS5mTXTRjdcAsL7nLy+Sr3QCBTdGP0tiodd8/IGeWF36axj3emeUIT9yXXUsmV+0fZvkuospSy4JyGzTNpAqQYQ8tPQk87wAsnTVPwMRDQnESC8d0H1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiYkQMPW4LLjzzIZpVjqtc1nsWS8h4p2t9snjapu0iw=;
 b=LxdcyxgtQ2DoJeZu1KpnNZS1Sg82DKJyS/7pBBwjRPgLynPPqW2oqSEfI6A1M4gjGk9C5GsjIIQF/kHnEVJul22Yln1FaObjufkz6qh2FUTh0pMDnHEHnK0CtB5lcpQszb1W9Kd0Vjg9UXCvVUlzRyux+0HwoXamvOQiWL9lfbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by MRWPR04MB12147.eurprd04.prod.outlook.com (2603:10a6:501:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:11:58 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:11:57 +0000
Message-ID: <674e9ec0-2fb8-4bb9-a158-931a6b55206c@cherry.de>
Date: Tue, 13 Jan 2026 16:11:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 44/53] dev-manual/vulnerabilities.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-44-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-44-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|MRWPR04MB12147:EE_
X-MS-Office365-Filtering-Correlation-Id: a05e9c0b-b928-4cfe-06eb-08de52b6184c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHdNMWhtKysydGpvVDdiaTUvMW1qaDVNbk1pVkRqei9mVzQySkNsaW1TRkoz?=
 =?utf-8?B?YWN3OXBzTkpTQ2piZXozbFhrL09MTm9JNk16NEJvMWVPZUVVVHhJK09OSW9T?=
 =?utf-8?B?YktzdTR5NHlGMDVDdDQ2L2x3RXhQRm0zV3JCZTc4MnRUZUo3dWEvOVlqRkgx?=
 =?utf-8?B?cE43VmlMUHcwWkxBcHFWKzRoZWJ5Qld1dUFYZXIwbWxQRGRLdG1pYlJYOUpL?=
 =?utf-8?B?QkRVaW5jajFVaUNGT1RpdUdzSUVoTEdua3A3WmNiY29HdCtRQU1QeUY0Q0Vj?=
 =?utf-8?B?YTJ3WEhmUElUcHJkM2pNdHZPam9PNDh3OUxpWDNIVlh2c2swcE4vUEVTQWJV?=
 =?utf-8?B?SFRhWUI0VDNKZHFpdGZ0T3FMeFJJeVBnTy8xdFpLeG5rdExlSkdqMXRkalVI?=
 =?utf-8?B?anY2azJqU0VTbG5GcXlCZHFWcGo4QkJsMnU0dm9OQnQ3elJuRlRNYlY1aUNW?=
 =?utf-8?B?M2ZOUnNlK2Evams0YWxpRGxHM3NDOFV5WEt3blVwQXA3M2Vrem5DeWhjaU9H?=
 =?utf-8?B?aEYvdk9GTTBzaHI5alR5OEE3UUQ1MTlQVGJwV3JqVFRYVHdKYVlkaFhwajJs?=
 =?utf-8?B?YlJXMlYzRzlnMWJGWEZ5TnFHTFlQQkt3b2k2NU1IdlhQMzhxSGk0MWdEOUh5?=
 =?utf-8?B?Y1dOQ3ZJcHhXK1gxa3NGY29EVTM1dlFCS2d1VDAxd1daK0M0SmJXZUNYY3do?=
 =?utf-8?B?M09aeTRkZUxsT2d0QXI3bGRSa01GRzM1VDNMT1dGVUh6UU9tVm5NWmVEQnlh?=
 =?utf-8?B?MU5KWGxMeC9qL0ZxZUYrYk1qM3BhZGVya3dyTXd5RUlqRHkrQ1BGaGM3Q04v?=
 =?utf-8?B?amdFamwyYlhCc3lDcTY0QTRGYkNwUm5TYnMzZzlEYnprMVV3K0VPbjBNV3hD?=
 =?utf-8?B?OVN2WkcyMWQwcERrSUFScUtFTlRHR3FnUXN3SVUraW0yU3M0cUJ1TmJkaG9T?=
 =?utf-8?B?dm9HRWFCTjNkSEF6eEJNdDJyU2c4dGZyQm5kTUc5K1k1RGViSkJmcExmL255?=
 =?utf-8?B?Y0MxR0Y4Q1hPODNFYTNiNEJlUm5xVTF3OXphelFPaHJJY1YzSDV2aUpRL01p?=
 =?utf-8?B?SXJFeDBBYzBLZXUyLy9DOHNYOG1USSs0OGx1QzU2MkJiak83UTNETUJ4ajQ3?=
 =?utf-8?B?cVl5TkdXN1NkTzRGaGt6emNHQ1ZsOElRdG5pem1TUWhZQ1FpWFFLQjd0dEIv?=
 =?utf-8?B?Z3hvUkdCLzFpc2dFTW9uNCt1SjA3Tys3cVJRdVlXYXJwdU91UjVVRjlYWCsr?=
 =?utf-8?B?UjVwODZ3SmxYN2RWUG9RR0hLdFZJaitUTUtDbmE0NE1aRVpJVlNxOG9DbVN4?=
 =?utf-8?B?K0NyZ0sxN2lJT2IzaWlpSU5wVDlZU3lWWFg4NnBFaEMvZis2ZEg5SnUxSUlz?=
 =?utf-8?B?Q3drTFc4VThGZzVvV3pJS1NtZ2ZCMFV4WGhVOWFCc21ickJWTkpycjhUZlJM?=
 =?utf-8?B?Q0M5dUM1ZjFYTjQ3L2gwVGw2d3ZEM3VLekplVHZ6Sy93NHpvL3BEL2tXaDlC?=
 =?utf-8?B?NXE1MXJDRk1yZjdhUmllZ29ZTXNUUk80dEZVOFpnNmNUUkxEUTBKOXFjL2tW?=
 =?utf-8?B?VHBvYUZFZnVnRWRIdStTRDVvbmsvdlN3U3VmR3R6Z1Z0SklWSlZ1RlB1ZUVM?=
 =?utf-8?B?emZIYXBCUkVva1lyWFQybjdpa0JMaDEweDQwNHZtMVppR2VYYTdOdmZ6MFYx?=
 =?utf-8?B?cVl6VEFESDlnREtZQnRXbStmdklRNGN3MEhMMEV2MDhYRHRrUDd3ZGt6M3VI?=
 =?utf-8?B?VnlpRUdYWHlIMTI2VjdGOUkrRUVTUlVVcU50U2tBNGlZU2Q4QzF2UTJQWHUx?=
 =?utf-8?B?d3NwVmFzSDlvVXdTUGc3T3cwRy9CMUJQazB0Ymo1a1E0WEdZY2N2UDJ5Ungv?=
 =?utf-8?B?dFhoSldZTmE4aUlmQ0pwdFhycUdvOFJUMmkwNmtQQ0tvTkYwTy80VDRIYVov?=
 =?utf-8?Q?nF7W1Z+g94P+iuoJDX+si417XazraEAp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFVRRnBXQklnZlJiVnBvMUQvUU9JbjJ0VFRITFpLWHEvZVhxQVlKVHUyazB1?=
 =?utf-8?B?MkZiNlZKYmRDckw2YjV6SDNud3hpa1FJc2tkdzRZRWRHQkdYVEt2L2dicEZl?=
 =?utf-8?B?Mm5lWVJESWY2bkd4L0JIYjlCL3oySXpJTUI1amt2VHZOQVpibEd4QTVVQUVi?=
 =?utf-8?B?a3gwSUJRM1Y1T04vWk9mbC9zdHBIaGViSXdneU5oajBJMVpJVDNKNERsN1kv?=
 =?utf-8?B?SG1qTDN5eDRQcWgzaWIrdEMzdUZReElMS1ArWXJJRlhGeTZzN0lFdVBvTlVH?=
 =?utf-8?B?L2tMb2NSYjBxLzcxaWdIZ05hcnlwSmkrNEFDcGZYWXMzdllVSGRuWXR5M2hr?=
 =?utf-8?B?RjBRdFlPdDB5SW9zM0sveDRUaWx2RnNMSDF6bUlib2NhbnpQbFcwRm9KOVFq?=
 =?utf-8?B?dGx5RFM1VFRZV1g4VVI4eU1ZMExQc3A2Sk9LcTM3RmVLamtKSjgrRVl2TExz?=
 =?utf-8?B?NEJlbXhIWG5Qa24xN1hodHBxbTVaODAwQnNiZW9wTExXUkJ1eTltTE5iMlUz?=
 =?utf-8?B?VGQwTVVjaXlBSXNtSmhLQ2dpTFRBUDk1aktRVmlYcjV4SHdBaFJUUi9FZGIr?=
 =?utf-8?B?N2s4ZGlUWEIvbE1LY1lvSnFxa0c3NjU0VmNzc1NKTUFqSnUxMFRKdTIxdGJn?=
 =?utf-8?B?bU5GbHJXVHRjemFJQXllczJpTVJuV0VTYmZLdFVCUkVDR3g5M0xlZGhXTTdz?=
 =?utf-8?B?ekhYWmRsamFGV0V4cC91V2RjZ2xUVFZyd2xXaVNuMFdDTE9qNXBRb2V6MzJt?=
 =?utf-8?B?VzVjUEUrMzl6d3J4Q2dEYmFzOHUvZnZWSTBxRk0reEV6Z0NGNHNLRzJjNVFI?=
 =?utf-8?B?Ym90S0E0T294Z2c5MEdaOXNYRkFHNXZKL2VJRW5HOW1TN01sUlJUbm51YkZM?=
 =?utf-8?B?bDNUZjlYcXF0M09BWElGcy91Z2dPRVU3YkFmL2RqeVpxVXYxN3Y2bnlDanpE?=
 =?utf-8?B?cEpGMWM1RFF1bXpFOTIybmtHN1lOclMvVjgzZmlZRmdOTGVuMmgrWmtaYkU4?=
 =?utf-8?B?aDBYbDNueFg0YnFHQyt2c1pDVDdRTXE5YWVNQVNhOWtPWEl3OTR2NVJ0eHM5?=
 =?utf-8?B?NGxmUmdYbDJvTkVyYVFNLy9tTGZIZGdYcGd0MFJxTjIxQ2RQaWVRQUFOR2JU?=
 =?utf-8?B?eE4yR21iSUNMbWlwa29OdVlFaEwrUC83UW4yTmd4THdGV0ZQZTg5SXBJcnRW?=
 =?utf-8?B?UjVLNU5adndIWGFQQTNZdVkyK2tkVE1QOTIwdW1oenkrZ0d1WEdzNTV1UnY4?=
 =?utf-8?B?dWREUThKdUdhSmJqWFFNWi9RNkltZXFhMEMxREM5UmFXcWFQZGxMZ0ZyK0Fz?=
 =?utf-8?B?blN0QTlWN0I4K3dtYTBJWWFUVllUZlFUQ2k2UmVFOGZ1STNkdEp0WEdDWHBZ?=
 =?utf-8?B?bUNNTGxtMWlOT2JzZWQ2NWVCSUwxREdMT001THRvbkhGTzg2Z2VDamgvd1Fh?=
 =?utf-8?B?ejM1aE4zNW1nZG9XU3pNTk1wU01DYkpPUlZMNmthYnA4R0VQUWxRTjdPbEdB?=
 =?utf-8?B?VnVCekp0cmt4QkMxSTBaWVZVdzNKUTJ2WmZqdVJJbittU040TWFFNnB1UnJv?=
 =?utf-8?B?ZFdRYk1NVmszVmFXeUtoK092Z0l1WUNzTjZhVjNNRWh5R2FpcmwvUVpWM2R1?=
 =?utf-8?B?KzA0Rnk3SFdEZW0zQis1SU9GOXNXdUlYdXEzZ2dQYjZCUnVsM010Z00wMGhF?=
 =?utf-8?B?SXRTRVRHaEZXUUEyVy9TcjdLcWZoTWVlWEM2bGNqUDRDTGRxUDVwY1pnUXBG?=
 =?utf-8?B?dGNWdnl6Mys2T0pKL0lkNnIxMjZheXBLY3JOUHJFSWZFZExDMGliZ3ZIcEwy?=
 =?utf-8?B?Qm5YNjJrRHZVR2UyYUljbHB3NVJZY1Q2RUVGTmN4aHFHMEZ4aDg5bHdLTWxE?=
 =?utf-8?B?M1BzSEw4TTFxSWZZblB3b3A1NHBLVGRqUklKaCtma0FQSkp4VHZEU1pBbFdV?=
 =?utf-8?B?bHZUTzIxdlFOamJTUmowbWR6RUVjcXFxYmp1OGlLOFZoSm83aXJYUy9RR3la?=
 =?utf-8?B?ZHl0QTlUdjQ3V2hjSWROWUcwK1BxV2g3aU1IRE9CVmtMR09SM2p6QVRneHZ1?=
 =?utf-8?B?eXJZWlVsb1FnbXd0a1k2elpIdEQ1TTdXTitKM2JhL1krUEpvYWEwWEZRbUNi?=
 =?utf-8?B?anZPbTN6QTMwdW8wMktFdzZZQlFNTTZzK1lyaWg2UnBlYldqbzd3Z0YvTlhi?=
 =?utf-8?B?ODVSYlpkcU10cjFTWDV5QVhQeUg4TDIyUm9NNGtaL2ZUaTZYVmk1MnNHRm9h?=
 =?utf-8?B?M2drdG9raXBZcTc0Z0hrblVYQXpBcUhmcGFlTXI2YUF0bXZIa0FsaXNmZGdI?=
 =?utf-8?B?d0ZLSmRxdzQvV3Z4Rm9OelkxMWFRVmFhNlhIREJ2a2dsNkdzajY3UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a05e9c0b-b928-4cfe-06eb-08de52b6184c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:11:57.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoNPAavtb9gt4TS2LqFQC+XRiYNiQBAni7BKkia86nSf5xyaEKkGNUaLl7J/Jjn63bQ5ec7q/slj5AscJsd1biV9f/MWLw7wNXbjvcLbHMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12147
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8533

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete. Mention
> that only vulnerabilities in OpenEmbedded-Core are tracked as that's
> where the packages are.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34519CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 15:31:26 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.46])
 by mx.groups.io with SMTP id smtpd.web11.54642.1695051083560585361
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 08:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=LJR5+a14;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.46, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2eMq49kLuo9Klu2RCCHltrGlT8kKkuOdp1G7Z0lBGqOAJglDmXJ4Joxctj+FvS2g5dEZjxc8uzJ122HqMYA5KuhJfWv6fcM9BYGEpcuDZScG7NU87PS92PTJhCN5GCCN3fAWBeyFz2ANyJYOpVU247b7gV2rCmlXOxo/A5b8X4ORhv0W0haAIHzcih08jVki/3P9jOnFXkaeWyF6CvNPmrjAydKCCQEWSM4uYlVZnnHbrubs9Z66oSx5hCpdtcAscKRVUN74iccg7iCOZKYQXDimZRTzvNBRaO5CfL79EXqYxjhYkadTqvOSvXnwPAaizIShpK/BwPPbmjcCXQYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B28HsFH0C40iHbKVGrn+I8wz6JfzmaM905vJdEjHTms=;
 b=aHYtL8EaWJNSopH9z8l9IHLL0u8yLuHFo8pXcSQHTIwQJxRCzrkGFEoi67iCsA7TJGW7LlZCXiGRUk/Ry1BIp1uiFO1RV3LHp10+K0WbOSMdoKTpNB75o26/YrD1Rc4Vu81y0+Cqq9+4ZtvO22c0yQzBNRni7ck23VIctrNweWY+ROBp68ip+o+kfF/aDVhhkI7s2neXA5jZCRBpx0wf5/uOVNdvQFAg+JDvpkAT2an9cCXJJWHsALwLzuMNZFYXc75a2AITLhnVg/++Mi7GuQsm+kyGGJk1ebZLHKznzyrrYmQg5VhBqatbAUvq6jF0UKMzcIuRRiC6u82tCS8xzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B28HsFH0C40iHbKVGrn+I8wz6JfzmaM905vJdEjHTms=;
 b=LJR5+a14WKFpxIyDwj6PdKTBt6slRjC6RKbPQevpCIL97Homybbv3FdJ2ixBzR9AWWxb4i5VIasbLppkK0rdQFGuYa8QP4h15YRGaTxmArfyJbgXwdGtqTfRo4LDDtnKMWr6m0DiGQhEf3+FeC4cqBUp5pAs+EaE0BUlOzq4hGoBchDpq1aBkD3Xaukt7A5Wui1loKmOXKMSePFSLPNhBsVq/4TnxmYiXmT7UQJrdKLNbaaIkdbbUB9wb2xh+vgOWFaIddgjYCXVv3frLfEIFOqZkt/gUCVejtJfgijCVghnLXh9zb20/LYa1vIKEpmc5weIbSQmEtXvuVIAgGuiwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 15:31:20 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5c00:6152:6ce:72b6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5c00:6152:6ce:72b6%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 15:31:20 +0000
Message-ID: <ee3431e7-3acb-1b6e-0b47-abdf627b153f@theobroma-systems.com>
Date: Mon, 18 Sep 2023 17:31:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [docs] [PATCH] dev-manual: disk-space: improve wording for
 obsolete sstate cache files
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230918150916.486857-1-michael.opdenacker@bootlin.com>
 <c98cbf98-0335-d559-6673-7348b4e4295c@theobroma-systems.com>
 <a7366b33-b6f2-a79b-9bc4-7b6ce8eaa310@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <a7366b33-b6f2-a79b-9bc4-7b6ce8eaa310@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PR3PR04MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: ff526426-1c2e-457d-738f-08dbb85c4ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nbqhZV/q5n+Xaw9Wl3aPlDZ3ZFr1m8ZaScXik7PrkEuGZXvQkalFli44SOVsXXJQL4LLavtWRGZKCN0AKpVAegyWfFWA1OynLf/ako/NTx0kqaJ0kabAO5J1jnpzYOexMgEAJqV95Bp7MxmREFXu7CD/hFqKzbjkXXWhz+V8uMaRDwypqTmKjOpsJlWw3sWO5vqutKDvZY6eU9Kw2NYVmUNfV0FWM2i402GJk7Ps+DUKH5I0V4UgdGRcNh9iuol2uTYOZAazehnRfMTKKSlb3WGRff6i2EY5c8WGs7IeZZadxnxdPGID7ERUK6Odd/qOT/81tX116pICMY9jOia450h03BUKAVS6h3ZWbxCBkYfp2nrJHOcCALqPSeOd/xC/nuxAR1+uYw3p4o8RsbNZsrSlxNnCM/rhVekyamTQLSewsPz6nuam3rzpabQcE4kIpnuVZAG386RlXHOiszkYKja22RbafVTqT/yyjmvLNK/UloI+GN4OA6fawKueJrDarAxSvsE/hIkDWBn6AB3I9A77RMofc7t4xipMirV8tHgaWRBeJViMcQ8V1POyhJe9MFfCMRX7PttzoRt9SS0ctuNNc9nGEQfx1IAtmLMw6XXUcfAaPPy5jC2b77ymgowibTj5Tau2aR1H/hub4QDVAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(396003)(376002)(366004)(451199024)(186009)(1800799009)(2906002)(31686004)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(316002)(66476007)(66946007)(66556008)(478600001)(6506007)(53546011)(36756003)(6486002)(2616005)(83380400001)(6512007)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FLc7ygYi10NZeJkbI52tK8vOvr7HRumAVsWMv7pLBe1PN+td1y5rEl/Cm5AM?=
 =?us-ascii?Q?PSH06mnl0OUqkzFxLG9gXAkT79QWY9rm4p2X+0dVHs0ZEsUYCn7IwWsw3mzj?=
 =?us-ascii?Q?Xh6vMko0A0bllDi4Xg+wXFxF8voeBBTCbyHOnpLJOF9xHf4vCOpWvsS+xlw2?=
 =?us-ascii?Q?tbySbWgGR/DKY1dQYLSKKQqHBEEQO2AvSXDYQIRfmHXvNrTcrAr3cXbk0+BH?=
 =?us-ascii?Q?OKpFptP5i0SQ9Sf1FlyxtoxrNOVBixCeycz3OZKmETD5BL8LSQQfAhP3I9m2?=
 =?us-ascii?Q?XMvGb8dfrX0TdBIXlK1mTb1mLzip4sVwnaQFKoI5B3DOor0o8o5/SiOwLEmn?=
 =?us-ascii?Q?63fubwpVwrVWneURYuCGne4EciRfZ6trVeg9qWFfCWZNXG4BmN8vi2BKvGju?=
 =?us-ascii?Q?Jrcp1mCqsz2pMGzYhGp7x/WiWxOiT1IJtmPyDVYGz8vfFFG9/5iHjUNGFxuQ?=
 =?us-ascii?Q?7SpALn1xAUOEnFLCsCttJKxvjWEJFBp5Yye/CKTEYu/6Rq8ZUBhWZyr/5Tvg?=
 =?us-ascii?Q?buDvxzu+XxfeaWzw23q0dssFV8kGhVAGW5dNA7vy+62OcaxzdiNZEr3f0j5b?=
 =?us-ascii?Q?9fByooONW2nXNyiyPUc5QTB+5VTgIMjq64HyMqc8JPM4omIywQ1hLl6DusxW?=
 =?us-ascii?Q?34mdHE9Lgk0xNxbIxLsdBDmqrMqHs1VlBFLA+OCMGZ17epSp7W9yCbZKvpdI?=
 =?us-ascii?Q?2GaJlfkW6qZLjCPzwWOavTd3x/udnNo1XSBKI8SePJjTmOdBdfg0Whr+vI6J?=
 =?us-ascii?Q?/iQb2LD3TkVXhTesAmLUTDP/Iz4SiR3R7+M3QuBUxSjZ6dLgztQ3u7/iq33o?=
 =?us-ascii?Q?mZt/utnB6kyy8bcFU+k4Qf3jvSBKd28Gn2w0svCgoZTOz7fazdfo8qAkh/4A?=
 =?us-ascii?Q?g0T/aK3NyM+YcM6WNSmuwo6M7YhWKhlrM9tGiFWL+eP+H9NFd5z30fNgzGqa?=
 =?us-ascii?Q?hEXct/bDaMWLV0KCfAXDFF9BUNlXHr2CJNn0LHkZQES1W3ImfAUGCdiJeQHW?=
 =?us-ascii?Q?ZBY68vH9Xq2uvXFqInt04Sw+oQ3qH8rjuDgI6KdZGWmvMXbpW1GsfFs3hwi8?=
 =?us-ascii?Q?+kBxdS32IWdMswmL9L01eg3arlHPWJZ4rZpXw4kAISYcvmkVx3K6hAQoNkMI?=
 =?us-ascii?Q?/H2X86Yf8AKNAqcr4/UizHYmXCfpeXtH5FzxVUmI3ZiWz8jH+FTl8+77zlZj?=
 =?us-ascii?Q?5PmVpeZr4acahx1yOGg79XdhPODy/qT2GYSo3MLbG9rYWNnmjcmXS5E/ijtZ?=
 =?us-ascii?Q?LIvhlZmMZf6SqQHG1PkGGdFKpyztE42wouL7YVw6uyWuZhB56qTfarVxY1ig?=
 =?us-ascii?Q?ZE3tM27XIDFSr0csS9wmThEeCuFCE789ghSI9kqrkeOtumhxdLAS7T2JZhi6?=
 =?us-ascii?Q?EQm31KxlS6BSuPO8OCya2zXn7yZyqiLLVTZdOQvKCvc95szbwv9H81WK8dDl?=
 =?us-ascii?Q?61g/wht+y56b9ULU/xxRQSUzk/bEkaBHq3oi0StF74uT86I0HxFRzjJF56tX?=
 =?us-ascii?Q?F/EPgy2lR9Q2xHbhdGefKFxvEth3I2tay1SmfserutDCtDYc+IYWurA1OsDT?=
 =?us-ascii?Q?pnIxKhCEUPYFRrUKXLPuYPFGNXxOJe/SzKvc29WbyqjPHYlilubabenmULOQ?=
 =?us-ascii?Q?nlrqUpytkYfdunc4vu1EVgTmPVPTN2ARh1O0ogib3nkNwTt0QZO3L/MEqCbk?=
 =?us-ascii?Q?uG4Lgw=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff526426-1c2e-457d-738f-08dbb85c4ea5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 15:31:20.0091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1T8/rReJGnRN4TulgS1aAi5ZLFJI+IXRld6UjybCtWewRmW1/Wd3QwBm/9rczH0dVNxUt7UbHL6U8DtWmeZ2C0DSH/jSgymWDx3QE1qAjHrx57p0pfxv2Mr37/nneWDY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 15:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4228

Hi Michael,

On 9/18/23 17:28, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> Thanks for the review!
>=20
> On 18.09.23 at 17:14, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 9/18/23 17:09, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Replace "duplicate" by "obsolete", more appropriate.
>>> "duplicate" probably comes from the "--remove-duplicated"
>>> option of the sstate-cache-management.sh script.
>>>
>>> Improve other sentences too.
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> =C2=A0 documentation/dev-manual/disk-space.rst | 8 ++++----
>>> =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/disk-space.rst=20
>>> b/documentation/dev-manual/disk-space.rst
>>> index a84bef4511..5b6702f594 100644
>>> --- a/documentation/dev-manual/disk-space.rst
>>> +++ b/documentation/dev-manual/disk-space.rst
>>> @@ -23,12 +23,12 @@ final disk usage of 22 Gbytes instead of=20
>>> &MIN_DISK_SPACE; Gbytes. However,
>>> =C2=A0 &MIN_DISK_SPACE_RM_WORK; Gbytes of initial free disk space are=20
>>> still needed to
>>> =C2=A0 create temporary files before they can be deleted.
>>> =C2=A0 -Purging Duplicate Shared State Cache Files
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +Purging Obsolete Shared State Cache Files
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 =C2=A0 After multiple build iterations, the Shared State (sstate=
) cache=20
>>> can contain
>>> -duplicate cache files for a given package, consuming a substantial=20
>>> amount of
>>> -disk space. However, only the most recent cache files are likeky to=20
>>> be reusable.
>>> +multiple cache files for a given package, consuming a substantial=20
>>> amount of
>>> +disk space. However, only the most recent ones are likeky to be=20
>>> reusable.
>>
>> s/likeky/likely/
>=20
>=20
> Oops, fixed!
>=20
>>
>> s/reusable/reused/
>=20
> I was going to say that I prefer "reusable", but I guess you meant that=20
> the combination of "likely" and "reusable" is applying the possibility=20
> twice.
>

All sstate-cache files are reusable, that's the purpose of a cache.=20
However, only a few are likely to be reused, because the metadata when=20
they were created and the current one are more likely to be the same or=20
similar enough for the cache file to be reused.

Cheers,
Quentin


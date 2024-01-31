Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FD3C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 08:35:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web10.9906.1706690108482023723
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Jan 2024 00:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=TgZsNhrW;
 spf=pass (domain: navimatix.de, ip: 40.107.21.83, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOEPiovw7/DJ085cXlU3/+3/cOgACw9g9IbAdS994gahIuQl+/i5/RyZA728ds475y9ZdYmOFtqIrcZ3js9HbWriKvLrsW1qVVshiDe3uaIm174CgyQ1e+s9odOuweYXqMv7IjAjEUax5f/RUpvUwl5uByzzGnGXW04StvAYgP/7s93jaB0e2JmDNzNlq2um7GlK90R15pvLytv0RwgMGOmrlxmgEQl9SVL0yAfqz93zuKkJSZPQKPM0pnC+81EGS9zJaVjhMm/EL+COv6SRB7C8J9TaC/c0Ym4hpAs8phbbO4fRrDLCrPKnvsm0G6wY4ZHmJMj/PWWZBjewA4b9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VsontTOkDnB4xBhPW0eCtc4DN+ex1WHytAH7zwiJCw=;
 b=gWJrLZzKVhwlaCjOdi7p9b+3x9oj8/v3kC6I1dd/TD1LSDZO3EyaExv8wi/6Xb0d9YU5cRiA3BEj165iKg/Z9Pdd5vyNzm3FPDHu68Waxt6WdLf38CNTbNg0boRscvqDd0ZMWDiuEXEKzCnUaMNq3NaFaruu6X4HqWd+uci3vkfMjDn1MFhoBDKjzEKudGbQVIAu/Xkk0v3gAvdvDVbUj1hTjSw34sGMtBfqNgOaca8naN9q3TFQ+VB1AaFZSGGJKwP4Do/U2W+rrbhBMYkpg/KsdXJ8v9+XCXAuWbKbyUUzbhLEmath0Y6/aivqdtjPSF63sc128ZuOQX0dAcZnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VsontTOkDnB4xBhPW0eCtc4DN+ex1WHytAH7zwiJCw=;
 b=TgZsNhrWsW9Dj+aRmv8jF2VBnTC9B2mJGUig7LdpfUE3DfQzbDc1Gn/aBHjca99KQOOQougDYU9+o393wHibT1lcGpF4I/qXgqwy8sXCIQhVR1Ucm78CtDyYicLw8mmvE27KHncbY1veYGEWVSNolgor+FvT6CiehgqWe85pdeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32) by PA4PR01MB7696.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 08:35:02 +0000
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00]) by AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 08:35:02 +0000
Message-ID: <1746531a-3dc1-4413-aa91-47808ecd3b89@navimatix.de>
Date: Wed, 31 Jan 2024 09:35:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Content-Language: en-US, de-DE
To: docs@lists.yoctoproject.org
References: <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
 <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::7) To AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR01MB4627:EE_|PA4PR01MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 77316316-a3a4-4a50-e286-08dc2237846c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jJRbB/T2PqkeG8/tU0PRW2CLYZNqBSL53rgCoVZUVInMeSNKQYiB6Yi7epI9YBrx3MZkfd0fEdT1yTsNi6VVNdmP+/aXAM62AhkKZ6Uo50ZhmyMwD7X3eN85UMf8zi27Y4Sn08mDsvEvD22gk8ftQab0WjMySqIxs8hwuzRMrHypzmG8Q3P/7k8AWh8roTpAuiwQ5baNTfQe1XE9b9E9K07gqTPjOrt8ZR8k1PSsCTErvPZRvdfAAA2fTfb8xgcicfj7Cp7W4WKzZ58IXjMYZM6hHs2LCD/TxZnI5w4jk7BWivN6ptrb/PUVSfVP4WHTNRmdqQJjvlTXpyYbOzgfuy6zNi/Et5U9az4+yBXtF7pxvEGmmSQA5Jc4bnYq4tYLEZqTHJJRTmgMXgzP4Q9vV8gxEAtFhHCOfW/dolWdjNWLSqojsBbhUDE97v6HzJemuVRnTkmD0i5NKOKewJtpvlLqhpKjb5x8b/Okm8L+sPkkI7QMLjllYCJ7+nHNLWWeDdEQbWJk8tWRRrLDhnidSO4RoW9fxhAeURf8HCj5Ie2vVNzU1ORlfUjTP5UwEymanKBg11fnk1nU4+o7gokctUi5t0yBN0B6h9HIALuRdDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB4627.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39840400004)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(66946007)(66899024)(8936002)(8676002)(2906002)(5660300002)(31696002)(86362001)(66476007)(316002)(36756003)(66556008)(6916009)(38100700002)(53546011)(6506007)(6512007)(478600001)(6486002)(966005)(83380400001)(26005)(2616005)(66574015)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zBGE6/X4m+TC2rq/tcmwDKZvEjYiSeEf3wbKnYE9aOah42ZA/PB0V/GNqNXx?=
 =?us-ascii?Q?shBTKB4egXIOx6TweLVUDhkxJKXFbzqH+1W57YnFhWqXWi6cf4WONCJCygWs?=
 =?us-ascii?Q?RU0Mmpv26ITMYZ3bXkujvq16KuD5s2aWH1DTh+w9o9LflsX5quAKqKbDuh0G?=
 =?us-ascii?Q?Tq2vy6MN3jW0xTsBFTcgcf8ptp9E/AH2iAKdjyNEUokQIAqCTTu+9cGrV9EJ?=
 =?us-ascii?Q?f25HKNNjVhA2B550My/DjE3EzDF4mdemReH7luLjD2sxa2aJ/GNvgHUzT3/b?=
 =?us-ascii?Q?ciHCxBD0FkazFNsXEhvYO9sRYBjOuMTwQhjtGwZHYefzizCIWzQnc5s6SHtW?=
 =?us-ascii?Q?4hbnQmOfILHuLvhwK0eg+X/xbd4Et2Q7CfAnB7+e45/Kd4EQQUTWCMuRBRTk?=
 =?us-ascii?Q?OR95MWrXDP2yH/jdOOmLQshk9pY5vIPCr1EwVVSmD5SwB7UXaYQyUMNCLxeS?=
 =?us-ascii?Q?8d0/xAKMtatyCrUkJDx/CqoYswKLaKutJGYoQGyooT1ZPMKoceonF0gBhGJ1?=
 =?us-ascii?Q?SeDNPU7BaNxVi/1E07BbMxEBV5JPLLGvEhVA1ocrajg2dnOhX25w2OLVQ7cr?=
 =?us-ascii?Q?uXLKjOeAYFQeH597brmDHBE2+5c9WnWisB1ZjtNcEzOTX4+/zKQU9Axlx2ra?=
 =?us-ascii?Q?hODo6xXDFBxX/PMETlI66Am3aNjh28L5kHudQPANF3SC6AAqmfN2rQZU4Tmg?=
 =?us-ascii?Q?O/tJzsOdOIXxIXEu1nGE0SOmn/2etrlJEydsYl3TqrKlIFKh/lndXZERLP2u?=
 =?us-ascii?Q?3ENmuR7WRrrOIDvg4MY9WO15aKjDSKT2ddlzLhihIPOmMxBoewpQF28jMprb?=
 =?us-ascii?Q?nsHK1MwVtoNRKYC94lLgQXJgbTjTj4YtmCGoMamqVJR2o7aCzxqlKhoMKL+v?=
 =?us-ascii?Q?S/OIXWRSBWFg/GWe09u+0EOaC+BWf4M1SwH4BXbnJFWTY9U3+qOVimcP+MuZ?=
 =?us-ascii?Q?VqkAaYdTG/d77HoH4c879/zyDlweqBvNNJ9dSTvLSTW2TC+m3vCFOqGMvygX?=
 =?us-ascii?Q?FkTfp/716mLBSqH3wGjDNP3oGVGBlLGivUDHIYdCPqh//XjIjaELrdFTUk52?=
 =?us-ascii?Q?mRg/XqjjM1syV+GeX2WfWiMSbKHpu0zsLOvZsc5vkJKWNwjoc1B/8/oQ4+3h?=
 =?us-ascii?Q?mtt6d3LMciEranZxdyNmCKr6M8qFWEbB/aPaR5csRKvX5JDKQrQsRM14ZyZ6?=
 =?us-ascii?Q?33byMFJuPyBao7K7uOyzi+v+TC3biroVeN3AdUBljzUXzA/LGUmAvfgVH8S6?=
 =?us-ascii?Q?F/xdetS/Pq15WVEVcQDf6GRKQdk3hCft0p8VUfVjFgui+XcsJDQTe3U0Kf6h?=
 =?us-ascii?Q?OetIYC1q4cZ3P9PLJ1i8xvfy0QXziIOrbdTnX8MLcvbT7nNqJVdxBRYINpCe?=
 =?us-ascii?Q?4EcFCEoBqebFshgVZ+70Cx4pIBfYwqpWdzEREcYtk0uZWmmVJ1Aj4ppjwF2o?=
 =?us-ascii?Q?X+0bwZjpQaeihnrFvCmnNumCxylE6WzpU/E85sB75h1oqNLU3O2DOnGAvZbO?=
 =?us-ascii?Q?prBbEuD38KWq62cOG7fe4psuB98WAEtdmfK2Ltk+U17ENz3T4VNyIuBM0uwR?=
 =?us-ascii?Q?GLsS4O0/vtxZIT7MtjAuPV81pDaZ0kBacgyE2ZbNOAFy6Piebe4FRf0etKF1?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77316316-a3a4-4a50-e286-08dc2237846c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB4627.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:35:02.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de4+OiwvtT5sQZ75w6M7Q0YtbZaG3w0SZDSVYil4VpfGxle/2rZ/yzZiNU5b28gRaWo/37uh0IuboSn/265Y6opQuxmUU/0dDJwkx6ahNno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7696
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 31 Jan 2024 08:35:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4803

On 25.01.24 18:43, Chris Laplante via lists.yoctoproject.org wrote:
> Hi Richard,
>=20
>>> Is there any way we could add =E2=80=98noindex=E2=80=99 to old versions=
 of docs so Google will
>> stop crawling them? Or maybe add canconical links? Or something in <head=
>.
>>>
>>> I=E2=80=99d be willing to help out with this effort.
>>
>> I'd love to see this solved.
>>
>> It was partly one of the reasons we updated the docs in the first place.
>>
>> I'm not sure what the right solution is but our docs repo and the script=
s we use
>> to build the docs are all open and there are definitely possibilities.
>>
>> I'm not sure if any others have opinions on the best way to fix this?
>> Personally, I'd welcome proposals though.
>=20
> I'm also not an expert on search so definitely want to hear what others t=
hink. Noindex/canonical URLs are just what I came up with after cursory res=
earch.

As https://webmasters.stackexchange.com/a/59368 explains the
Last-Modified-Date gives search engines a hint how up-to-date a page is.
Possibly all pages got a copyright update yesterday, which caused the
page https://docs.yoctoproject.org/4.0.15/ref-manual/classes.html has
the HTTP header `Last-Modified: Tue, 30 Jan 2024 10:04:44 GMT`.

https://rush-analytics.com/learn-seo/google-remove-outdated-content#step7
suggests to add the html head `<meta name=3D=E2=80=9Drobots=E2=80=9D conten=
t=3D=E2=80=9Dnoindex=E2=80=9D />`
to obsolete pages.

And another option would be to mark all old pages in /robots.txt as noindex=
.

```
User-agent: *
Disallow: /4.0.15

User-agent: *
Disallow: /3.1.31

=E2=80=A6
```

I saw at https://www.postgresql.org/ they announce a sitemap
/sitemap.xml in /robots.txt which has a priority field:

```
<url>
<loc>
https://www.postgresql.org/docs/current/triggers.html
</loc>
<priority>1.0</priority>
<lastmod>2023-11-09T14:01:28Z</lastmod>
</url>
=E2=80=A6
<url>
<loc>https://www.postgresql.org/docs/7.4/triggers.html</loc>
<priority>0.10000000000000014</priority>
<lastmod>2012-01-01T00:00:00Z</lastmod>
</url>
```

And postgres does not update the copyright of old pages. Maybe this
`lastmod` field in the sitemap could reflect the date of real changes
and not only rebuilds/cosmetic changes (which Last-Modified must reflect).


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


